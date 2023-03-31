#include <vesting.hpp>
#include <stdint.h>
#include <string>
#include <utility>
using namespace eosio;

static inline time_point_sec current_time_point_sec()
{
   return time_point_sec(current_time_point());
}

ACTION vesting::addconfig(const name& pool, const asset &token_pool, const bool &pause_claim)
{
   require_auth(get_self());
   auto its = config.find(pool.value);
   if (its == config.end())
   {
      config.emplace(get_self(), [&](auto &v)
                     {
      v.pool = pool;
      v.token_pool = token_pool;
      v.current_token_pool = token_pool;
      v.users_vested = 0;
      v.pause_claim = pause_claim; });
   }
   else
   {
      config.modify(its, get_self(),[&](auto &v)
         {
            v.token_pool = token_pool;
            v.pause_claim = pause_claim;
         });
   }
}

ACTION vesting::create(const name& pool, const name &user, const asset &quantity, const asset &tokens_unlocked, const bool &linear,const time_point_sec &start_date, const time_point_sec &cliff_period, const bool &release_monthly)
{
   require_auth(get_self());
   check(is_account(user), "must provide an existing account");
   check(user != get_self(), "user must not be the contract itself");
   check(quantity.amount != 0, "Vested tokens cannot be 0");

   auto itr = config.require_find(pool.value, "token Pool does't exists");
   vesting_s vesting(get_self(), user.value);

   check(vesting.find(user.value) == vesting.end(),"user already exists");
   
   vesting.emplace(get_self(), [&](auto &v)
   {
      time_point_sec end;
      end.utc_seconds = start_date.utc_seconds + cliff_period.utc_seconds + (int(quantity.amount / tokens_unlocked.amount) * seconds_in_year);
      
      asset temp = asset(0, TOKEN);
      if(!linear && tokens_unlocked.amount == 0)
         temp.amount = quantity.amount * 0.1;
      else temp = tokens_unlocked;

      v.pool = itr->pool;
      v.user = user;
      v.quantity = quantity;
      v.tokens_unlocked = temp;
      v.linear = linear;
      v.release_delay = release_monthly ? seconds_in_month : seconds_in_year;
      v.cliff_period = cliff_period;
      v.start_date = start_date;
      v.end_date = end;
      v.last_claim = start_date.utc_seconds + (release_monthly ? seconds_in_month : seconds_in_year);
      v.tokens_claimed_till_now = asset(0, TOKEN);
      v.counter = 0; });

   config.modify(itr, get_self(),[&](auto &v)
      { v.users_vested += 1; });
}

ACTION vesting::claim(const name &user)
{
   check(has_auth(user) || has_auth(get_self()), "no authority");
   vesting_s vesting(get_self(), user.value);
   auto its = vesting.require_find(user.value, "user doesn't exist");
   auto itr = config.require_find(its->pool.value, "token pool does't exists");
   check(!itr->pause_claim, "all claims paused for now !");

   asset tokens = asset(get_amount_by_now(user), TOKEN);
   check(tokens.amount > 0.00000, "nothing to claim for now !");

   // action(permission_level{get_self(), name("active")}, name(TOKEN_CONTRACT),
   //        name("issue"),
   //        std::make_tuple(get_self(), claim,
   //                        std::string("Tokens Minted for Investor Pool")))
   //     .send();
      
   config.modify(itr, get_self(),[&](auto &v){ v.current_token_pool.amount -= tokens.amount; });
   action(permission_level{get_self(), name("active")}, name(TOKEN_CONTRACT),
         name("transfer"),
         std::make_tuple(get_self(), user, tokens,
                        std::string("MMHe3 Vested Tokens Claim")))
      .send();

   if (current_time_point_sec().utc_seconds >= its->end_date.utc_seconds){
      vesting.erase(its);
      config.modify(itr, get_self(),[&](auto &v) { v.users_vested -= 1; });
   }
   else {
      vesting.modify(its, get_self(),[&](auto &v){
         v.tokens_claimed_till_now.amount += tokens.amount;
         int time_by_now = (int)((current_time_point_sec().utc_seconds - its->last_claim) / its->release_delay);
         v.last_claim =  its->last_claim + (its->release_delay * time_by_now);
         int temp = its->counter + time_by_now;
         v.counter  = temp;
         if(!its->linear)
            v.tokens_unlocked.amount = its->quantity.amount * (temp / 10);
      });
      config.modify(itr, get_self(),[&](auto &v){ v.current_token_pool.amount -= tokens.amount; });
   }
}

ACTION vesting::cancel(const name &user)
{
   require_auth(get_self());

   vesting_s vesting(get_self(), user.value);
   auto its = vesting.require_find(user.value,"user doesn't exist !");
   auto itr = config.require_find(its->pool.value, "token pool does't exists");

   config.modify(itr, get_self(),[&](auto &v){ v.users_vested -= 1; });
   vesting.erase(its);
}

float vesting::get_amount_by_now(const name &user)
{
   vesting_s vesting(get_self(), user.value);
   auto its = vesting.require_find(user.value, "user not found!");
   auto itr = config.require_find(its->pool.value, "token pool does't exists");
   float amount_by_now = 0;
   
   if(current_time_point_sec().utc_seconds >= its->end_date.utc_seconds)
      amount_by_now = its->quantity.amount - its->tokens_claimed_till_now.amount;
   else{
      int time_by_now = (int)((current_time_point_sec().utc_seconds - its->last_claim) / its->release_delay);
      if(its->linear)
         amount_by_now = float(its->tokens_unlocked.amount * time_by_now);
      else{
         int temp = its->counter + 1;
         for(int i = 0; i < time_by_now; i++){
            amount_by_now += float(its->quantity.amount * (temp / 10));
            temp++;
         }
      }
   }   
   return amount_by_now;
}

ACTION vesting::clear(const name &pool, const name &user)
{  
   require_auth(get_self());
   auto itr = config.require_find(pool.value,"pool doesn't exist !");
   if(pool.to_string() != "none")
      config.erase(itr);
}

ACTION vesting::pause(bool pause,name pool){
   require_auth(get_self());
   auto itr = config.require_find(pool.value, "token pool does't exists");
   config.modify(itr, get_self(),[&](auto &v)
      { v.pause_claim = pause; });   
}

   // pool - moonmining
   // user - personA
   //quantity - 1000.0000 HEL
   //tokens_unlocked - 250.0000 HEL (percentage calculate)
   //linear - true/false
   //cliff_period - 5184000 (2 Months)  (259200 = 1 Month)
   // startdate - 1679667131
   // endatedate - calculate (current_time  + cliff period + (int(quantity/tokens_unlocked) * 259200))
   // release_delay - 259200 monthly or yearly
   // tokens_claimed_till_now - 0.0000 HEL
   // last_claim - 1679667131
