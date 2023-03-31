#include <eosio/eosio.hpp>
#include <eosio/asset.hpp>
#include <eosio/transaction.hpp>
#include <stdint.h>
#include <string>

using namespace eosio;
using namespace std;

#define EOSIO name("eosio")
namespace eosiosystem
{
   class system_contract;
}

namespace eosio
{
   CONTRACT vesting : public contract
   {
   public:
      using contract::contract;

      const string TOKEN_CONTRACT = "tokensample1";
      static constexpr symbol TOKEN = symbol(symbol_code("HEL"), 4);
      static constexpr uint32_t seconds_in_year = 31556926;
      static constexpr uint32_t seconds_in_month = 259200;

      ACTION addconfig(const name& pool, const asset &token_pool, const bool &pause_claim);
      ACTION claim(const name &user);
      ACTION create(const name& pool, const name &user, const asset &quantity, const asset &tokens_unlocked, const bool &linear,const time_point_sec &start_date, const time_point_sec &cliff_period, const bool &release_monthly);
      ACTION cancel(const name &user);
      ACTION clear(const name &pool, const name &user);
      ACTION pause(bool pause,name pool);

   private:
      TABLE config_t
      {
         name pool;
         asset token_pool;
         asset current_token_pool;
         int users_vested;
         bool pause_claim;
         auto primary_key() const { return pool.value; };
      };

      TABLE vesting_t
      {
         name pool;
         name user;
         asset quantity;
         asset tokens_unlocked;
         bool linear;
         uint32_t release_delay;
         time_point_sec cliff_period;
         time_point_sec start_date;
         time_point_sec end_date;
         uint32_t last_claim;
         asset tokens_claimed_till_now;
         int counter;
         auto primary_key() const { return user.value; };
      };
      
      typedef eosio::multi_index<name("vesting"), vesting_t> vesting_s;
      typedef eosio::multi_index<name("config"), config_t> config_s;
      config_s config = config_s(get_self(),get_self().value);
      float get_amount_by_now(const name &user);
   };
}