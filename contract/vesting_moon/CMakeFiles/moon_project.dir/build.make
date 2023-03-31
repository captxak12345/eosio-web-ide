# CMAKE generated file: DO NOT EDIT!
# Generated by "Unix Makefiles" Generator, CMake Version 3.10

# Delete rule output on recipe failure.
.DELETE_ON_ERROR:


#=============================================================================
# Special targets provided by cmake.

# Disable implicit rules so canonical targets will work.
.SUFFIXES:


# Remove some rules from gmake that .SUFFIXES does not remove.
SUFFIXES =

.SUFFIXES: .hpux_make_needs_suffix_list


# Suppress display of executed commands.
$(VERBOSE).SILENT:


# A target that is always out of date.
cmake_force:

.PHONY : cmake_force

#=============================================================================
# Set environment variables for the build.

# The shell in which to execute make rules.
SHELL = /bin/sh

# The CMake executable.
CMAKE_COMMAND = /usr/bin/cmake

# The command to remove a file.
RM = /usr/bin/cmake -E remove -f

# Escaping for special characters.
EQUALS = =

# The top-level source directory on which CMake was run.
CMAKE_SOURCE_DIR = /wax

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /wax/vesting_moon

# Utility rule file for moon_project.

# Include the progress variables for this target.
include CMakeFiles/moon_project.dir/progress.make

CMakeFiles/moon_project: CMakeFiles/moon_project-complete


CMakeFiles/moon_project-complete: moon_project-prefix/src/moon_project-stamp/moon_project-install
CMakeFiles/moon_project-complete: moon_project-prefix/src/moon_project-stamp/moon_project-mkdir
CMakeFiles/moon_project-complete: moon_project-prefix/src/moon_project-stamp/moon_project-download
CMakeFiles/moon_project-complete: moon_project-prefix/src/moon_project-stamp/moon_project-update
CMakeFiles/moon_project-complete: moon_project-prefix/src/moon_project-stamp/moon_project-patch
CMakeFiles/moon_project-complete: moon_project-prefix/src/moon_project-stamp/moon_project-configure
CMakeFiles/moon_project-complete: moon_project-prefix/src/moon_project-stamp/moon_project-build
CMakeFiles/moon_project-complete: moon_project-prefix/src/moon_project-stamp/moon_project-install
CMakeFiles/moon_project-complete: moon_project-prefix/src/moon_project-stamp/moon_project-test
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/wax/vesting_moon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Completed 'moon_project'"
	/usr/bin/cmake -E make_directory /wax/vesting_moon/CMakeFiles
	/usr/bin/cmake -E touch /wax/vesting_moon/CMakeFiles/moon_project-complete
	/usr/bin/cmake -E touch /wax/vesting_moon/moon_project-prefix/src/moon_project-stamp/moon_project-done

moon_project-prefix/src/moon_project-stamp/moon_project-install: moon_project-prefix/src/moon_project-stamp/moon_project-build
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/wax/vesting_moon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "No install step for 'moon_project'"
	cd /wax/vesting_moon/moon && /usr/bin/cmake -E echo_append
	cd /wax/vesting_moon/moon && /usr/bin/cmake -E touch /wax/vesting_moon/moon_project-prefix/src/moon_project-stamp/moon_project-install

moon_project-prefix/src/moon_project-stamp/moon_project-mkdir:
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/wax/vesting_moon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Creating directories for 'moon_project'"
	/usr/bin/cmake -E make_directory /wax/src
	/usr/bin/cmake -E make_directory /wax/vesting_moon/moon
	/usr/bin/cmake -E make_directory /wax/vesting_moon/moon_project-prefix
	/usr/bin/cmake -E make_directory /wax/vesting_moon/moon_project-prefix/tmp
	/usr/bin/cmake -E make_directory /wax/vesting_moon/moon_project-prefix/src/moon_project-stamp
	/usr/bin/cmake -E make_directory /wax/vesting_moon/moon_project-prefix/src
	/usr/bin/cmake -E touch /wax/vesting_moon/moon_project-prefix/src/moon_project-stamp/moon_project-mkdir

moon_project-prefix/src/moon_project-stamp/moon_project-download: moon_project-prefix/src/moon_project-stamp/moon_project-mkdir
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/wax/vesting_moon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "No download step for 'moon_project'"
	/usr/bin/cmake -E echo_append
	/usr/bin/cmake -E touch /wax/vesting_moon/moon_project-prefix/src/moon_project-stamp/moon_project-download

moon_project-prefix/src/moon_project-stamp/moon_project-update: moon_project-prefix/src/moon_project-stamp/moon_project-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/wax/vesting_moon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "No update step for 'moon_project'"
	cd /wax/src && /usr/bin/cmake -E echo_append
	cd /wax/src && /usr/bin/cmake -E touch /wax/vesting_moon/moon_project-prefix/src/moon_project-stamp/moon_project-update

moon_project-prefix/src/moon_project-stamp/moon_project-patch: moon_project-prefix/src/moon_project-stamp/moon_project-download
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/wax/vesting_moon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "No patch step for 'moon_project'"
	cd /wax/src && /usr/bin/cmake -E echo_append
	cd /wax/src && /usr/bin/cmake -E touch /wax/vesting_moon/moon_project-prefix/src/moon_project-stamp/moon_project-patch

moon_project-prefix/src/moon_project-stamp/moon_project-configure: moon_project-prefix/tmp/moon_project-cfgcmd.txt
moon_project-prefix/src/moon_project-stamp/moon_project-configure: moon_project-prefix/src/moon_project-stamp/moon_project-update
moon_project-prefix/src/moon_project-stamp/moon_project-configure: moon_project-prefix/src/moon_project-stamp/moon_project-patch
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/wax/vesting_moon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_7) "Performing configure step for 'moon_project'"
	cd /wax/vesting_moon/moon && /usr/bin/cmake -DCMAKE_TOOLCHAIN_FILE=/lib/cmake/eosio.cdt/EosioWasmToolchain.cmake "-GUnix Makefiles" /wax/src
	cd /wax/vesting_moon/moon && /usr/bin/cmake -E touch /wax/vesting_moon/moon_project-prefix/src/moon_project-stamp/moon_project-configure

moon_project-prefix/src/moon_project-stamp/moon_project-build: moon_project-prefix/src/moon_project-stamp/moon_project-configure
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/wax/vesting_moon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_8) "Performing build step for 'moon_project'"
	cd /wax/vesting_moon/moon && $(MAKE)

moon_project-prefix/src/moon_project-stamp/moon_project-test: moon_project-prefix/src/moon_project-stamp/moon_project-install
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --blue --bold --progress-dir=/wax/vesting_moon/CMakeFiles --progress-num=$(CMAKE_PROGRESS_9) "No test step for 'moon_project'"
	cd /wax/vesting_moon/moon && /usr/bin/cmake -E echo_append
	cd /wax/vesting_moon/moon && /usr/bin/cmake -E touch /wax/vesting_moon/moon_project-prefix/src/moon_project-stamp/moon_project-test

moon_project: CMakeFiles/moon_project
moon_project: CMakeFiles/moon_project-complete
moon_project: moon_project-prefix/src/moon_project-stamp/moon_project-install
moon_project: moon_project-prefix/src/moon_project-stamp/moon_project-mkdir
moon_project: moon_project-prefix/src/moon_project-stamp/moon_project-download
moon_project: moon_project-prefix/src/moon_project-stamp/moon_project-update
moon_project: moon_project-prefix/src/moon_project-stamp/moon_project-patch
moon_project: moon_project-prefix/src/moon_project-stamp/moon_project-configure
moon_project: moon_project-prefix/src/moon_project-stamp/moon_project-build
moon_project: moon_project-prefix/src/moon_project-stamp/moon_project-test
moon_project: CMakeFiles/moon_project.dir/build.make

.PHONY : moon_project

# Rule to build all files generated by this target.
CMakeFiles/moon_project.dir/build: moon_project

.PHONY : CMakeFiles/moon_project.dir/build

CMakeFiles/moon_project.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/moon_project.dir/cmake_clean.cmake
.PHONY : CMakeFiles/moon_project.dir/clean

CMakeFiles/moon_project.dir/depend:
	cd /wax/vesting_moon && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /wax /wax /wax/vesting_moon /wax/vesting_moon /wax/vesting_moon/CMakeFiles/moon_project.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/moon_project.dir/depend

