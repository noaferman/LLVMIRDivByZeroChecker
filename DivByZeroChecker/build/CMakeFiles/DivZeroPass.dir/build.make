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
CMAKE_SOURCE_DIR = /DivByZeroChecker

# The top-level build directory on which CMake was run.
CMAKE_BINARY_DIR = /DivByZeroChecker/build

# Include any dependencies generated for this target.
include CMakeFiles/DivZeroPass.dir/depend.make

# Include the progress variables for this target.
include CMakeFiles/DivZeroPass.dir/progress.make

# Include the compile flags for this target's objects.
include CMakeFiles/DivZeroPass.dir/flags.make

CMakeFiles/DivZeroPass.dir/src/DivZeroAnalysis.cpp.o: CMakeFiles/DivZeroPass.dir/flags.make
CMakeFiles/DivZeroPass.dir/src/DivZeroAnalysis.cpp.o: ../src/DivZeroAnalysis.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/DivByZeroChecker/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_1) "Building CXX object CMakeFiles/DivZeroPass.dir/src/DivZeroAnalysis.cpp.o"
	/usr/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/DivZeroPass.dir/src/DivZeroAnalysis.cpp.o -c /DivByZeroChecker/src/DivZeroAnalysis.cpp

CMakeFiles/DivZeroPass.dir/src/DivZeroAnalysis.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DivZeroPass.dir/src/DivZeroAnalysis.cpp.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /DivByZeroChecker/src/DivZeroAnalysis.cpp > CMakeFiles/DivZeroPass.dir/src/DivZeroAnalysis.cpp.i

CMakeFiles/DivZeroPass.dir/src/DivZeroAnalysis.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DivZeroPass.dir/src/DivZeroAnalysis.cpp.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /DivByZeroChecker/src/DivZeroAnalysis.cpp -o CMakeFiles/DivZeroPass.dir/src/DivZeroAnalysis.cpp.s

CMakeFiles/DivZeroPass.dir/src/DivZeroAnalysis.cpp.o.requires:

.PHONY : CMakeFiles/DivZeroPass.dir/src/DivZeroAnalysis.cpp.o.requires

CMakeFiles/DivZeroPass.dir/src/DivZeroAnalysis.cpp.o.provides: CMakeFiles/DivZeroPass.dir/src/DivZeroAnalysis.cpp.o.requires
	$(MAKE) -f CMakeFiles/DivZeroPass.dir/build.make CMakeFiles/DivZeroPass.dir/src/DivZeroAnalysis.cpp.o.provides.build
.PHONY : CMakeFiles/DivZeroPass.dir/src/DivZeroAnalysis.cpp.o.provides

CMakeFiles/DivZeroPass.dir/src/DivZeroAnalysis.cpp.o.provides.build: CMakeFiles/DivZeroPass.dir/src/DivZeroAnalysis.cpp.o


CMakeFiles/DivZeroPass.dir/src/Transfer.cpp.o: CMakeFiles/DivZeroPass.dir/flags.make
CMakeFiles/DivZeroPass.dir/src/Transfer.cpp.o: ../src/Transfer.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/DivByZeroChecker/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_2) "Building CXX object CMakeFiles/DivZeroPass.dir/src/Transfer.cpp.o"
	/usr/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/DivZeroPass.dir/src/Transfer.cpp.o -c /DivByZeroChecker/src/Transfer.cpp

CMakeFiles/DivZeroPass.dir/src/Transfer.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DivZeroPass.dir/src/Transfer.cpp.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /DivByZeroChecker/src/Transfer.cpp > CMakeFiles/DivZeroPass.dir/src/Transfer.cpp.i

CMakeFiles/DivZeroPass.dir/src/Transfer.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DivZeroPass.dir/src/Transfer.cpp.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /DivByZeroChecker/src/Transfer.cpp -o CMakeFiles/DivZeroPass.dir/src/Transfer.cpp.s

CMakeFiles/DivZeroPass.dir/src/Transfer.cpp.o.requires:

.PHONY : CMakeFiles/DivZeroPass.dir/src/Transfer.cpp.o.requires

CMakeFiles/DivZeroPass.dir/src/Transfer.cpp.o.provides: CMakeFiles/DivZeroPass.dir/src/Transfer.cpp.o.requires
	$(MAKE) -f CMakeFiles/DivZeroPass.dir/build.make CMakeFiles/DivZeroPass.dir/src/Transfer.cpp.o.provides.build
.PHONY : CMakeFiles/DivZeroPass.dir/src/Transfer.cpp.o.provides

CMakeFiles/DivZeroPass.dir/src/Transfer.cpp.o.provides.build: CMakeFiles/DivZeroPass.dir/src/Transfer.cpp.o


CMakeFiles/DivZeroPass.dir/src/ChaoticIteration.cpp.o: CMakeFiles/DivZeroPass.dir/flags.make
CMakeFiles/DivZeroPass.dir/src/ChaoticIteration.cpp.o: ../src/ChaoticIteration.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/DivByZeroChecker/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_3) "Building CXX object CMakeFiles/DivZeroPass.dir/src/ChaoticIteration.cpp.o"
	/usr/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/DivZeroPass.dir/src/ChaoticIteration.cpp.o -c /DivByZeroChecker/src/ChaoticIteration.cpp

CMakeFiles/DivZeroPass.dir/src/ChaoticIteration.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DivZeroPass.dir/src/ChaoticIteration.cpp.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /DivByZeroChecker/src/ChaoticIteration.cpp > CMakeFiles/DivZeroPass.dir/src/ChaoticIteration.cpp.i

CMakeFiles/DivZeroPass.dir/src/ChaoticIteration.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DivZeroPass.dir/src/ChaoticIteration.cpp.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /DivByZeroChecker/src/ChaoticIteration.cpp -o CMakeFiles/DivZeroPass.dir/src/ChaoticIteration.cpp.s

CMakeFiles/DivZeroPass.dir/src/ChaoticIteration.cpp.o.requires:

.PHONY : CMakeFiles/DivZeroPass.dir/src/ChaoticIteration.cpp.o.requires

CMakeFiles/DivZeroPass.dir/src/ChaoticIteration.cpp.o.provides: CMakeFiles/DivZeroPass.dir/src/ChaoticIteration.cpp.o.requires
	$(MAKE) -f CMakeFiles/DivZeroPass.dir/build.make CMakeFiles/DivZeroPass.dir/src/ChaoticIteration.cpp.o.provides.build
.PHONY : CMakeFiles/DivZeroPass.dir/src/ChaoticIteration.cpp.o.provides

CMakeFiles/DivZeroPass.dir/src/ChaoticIteration.cpp.o.provides.build: CMakeFiles/DivZeroPass.dir/src/ChaoticIteration.cpp.o


CMakeFiles/DivZeroPass.dir/src/Domain.cpp.o: CMakeFiles/DivZeroPass.dir/flags.make
CMakeFiles/DivZeroPass.dir/src/Domain.cpp.o: ../src/Domain.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/DivByZeroChecker/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_4) "Building CXX object CMakeFiles/DivZeroPass.dir/src/Domain.cpp.o"
	/usr/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/DivZeroPass.dir/src/Domain.cpp.o -c /DivByZeroChecker/src/Domain.cpp

CMakeFiles/DivZeroPass.dir/src/Domain.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DivZeroPass.dir/src/Domain.cpp.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /DivByZeroChecker/src/Domain.cpp > CMakeFiles/DivZeroPass.dir/src/Domain.cpp.i

CMakeFiles/DivZeroPass.dir/src/Domain.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DivZeroPass.dir/src/Domain.cpp.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /DivByZeroChecker/src/Domain.cpp -o CMakeFiles/DivZeroPass.dir/src/Domain.cpp.s

CMakeFiles/DivZeroPass.dir/src/Domain.cpp.o.requires:

.PHONY : CMakeFiles/DivZeroPass.dir/src/Domain.cpp.o.requires

CMakeFiles/DivZeroPass.dir/src/Domain.cpp.o.provides: CMakeFiles/DivZeroPass.dir/src/Domain.cpp.o.requires
	$(MAKE) -f CMakeFiles/DivZeroPass.dir/build.make CMakeFiles/DivZeroPass.dir/src/Domain.cpp.o.provides.build
.PHONY : CMakeFiles/DivZeroPass.dir/src/Domain.cpp.o.provides

CMakeFiles/DivZeroPass.dir/src/Domain.cpp.o.provides.build: CMakeFiles/DivZeroPass.dir/src/Domain.cpp.o


CMakeFiles/DivZeroPass.dir/src/Utils.cpp.o: CMakeFiles/DivZeroPass.dir/flags.make
CMakeFiles/DivZeroPass.dir/src/Utils.cpp.o: ../src/Utils.cpp
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --progress-dir=/DivByZeroChecker/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_5) "Building CXX object CMakeFiles/DivZeroPass.dir/src/Utils.cpp.o"
	/usr/bin/clang++  $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -o CMakeFiles/DivZeroPass.dir/src/Utils.cpp.o -c /DivByZeroChecker/src/Utils.cpp

CMakeFiles/DivZeroPass.dir/src/Utils.cpp.i: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Preprocessing CXX source to CMakeFiles/DivZeroPass.dir/src/Utils.cpp.i"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -E /DivByZeroChecker/src/Utils.cpp > CMakeFiles/DivZeroPass.dir/src/Utils.cpp.i

CMakeFiles/DivZeroPass.dir/src/Utils.cpp.s: cmake_force
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green "Compiling CXX source to assembly CMakeFiles/DivZeroPass.dir/src/Utils.cpp.s"
	/usr/bin/clang++ $(CXX_DEFINES) $(CXX_INCLUDES) $(CXX_FLAGS) -S /DivByZeroChecker/src/Utils.cpp -o CMakeFiles/DivZeroPass.dir/src/Utils.cpp.s

CMakeFiles/DivZeroPass.dir/src/Utils.cpp.o.requires:

.PHONY : CMakeFiles/DivZeroPass.dir/src/Utils.cpp.o.requires

CMakeFiles/DivZeroPass.dir/src/Utils.cpp.o.provides: CMakeFiles/DivZeroPass.dir/src/Utils.cpp.o.requires
	$(MAKE) -f CMakeFiles/DivZeroPass.dir/build.make CMakeFiles/DivZeroPass.dir/src/Utils.cpp.o.provides.build
.PHONY : CMakeFiles/DivZeroPass.dir/src/Utils.cpp.o.provides

CMakeFiles/DivZeroPass.dir/src/Utils.cpp.o.provides.build: CMakeFiles/DivZeroPass.dir/src/Utils.cpp.o


# Object files for target DivZeroPass
DivZeroPass_OBJECTS = \
"CMakeFiles/DivZeroPass.dir/src/DivZeroAnalysis.cpp.o" \
"CMakeFiles/DivZeroPass.dir/src/Transfer.cpp.o" \
"CMakeFiles/DivZeroPass.dir/src/ChaoticIteration.cpp.o" \
"CMakeFiles/DivZeroPass.dir/src/Domain.cpp.o" \
"CMakeFiles/DivZeroPass.dir/src/Utils.cpp.o"

# External object files for target DivZeroPass
DivZeroPass_EXTERNAL_OBJECTS =

DivZeroPass.so: CMakeFiles/DivZeroPass.dir/src/DivZeroAnalysis.cpp.o
DivZeroPass.so: CMakeFiles/DivZeroPass.dir/src/Transfer.cpp.o
DivZeroPass.so: CMakeFiles/DivZeroPass.dir/src/ChaoticIteration.cpp.o
DivZeroPass.so: CMakeFiles/DivZeroPass.dir/src/Domain.cpp.o
DivZeroPass.so: CMakeFiles/DivZeroPass.dir/src/Utils.cpp.o
DivZeroPass.so: CMakeFiles/DivZeroPass.dir/build.make
DivZeroPass.so: CMakeFiles/DivZeroPass.dir/link.txt
	@$(CMAKE_COMMAND) -E cmake_echo_color --switch=$(COLOR) --green --bold --progress-dir=/DivByZeroChecker/build/CMakeFiles --progress-num=$(CMAKE_PROGRESS_6) "Linking CXX shared module DivZeroPass.so"
	$(CMAKE_COMMAND) -E cmake_link_script CMakeFiles/DivZeroPass.dir/link.txt --verbose=$(VERBOSE)

# Rule to build all files generated by this target.
CMakeFiles/DivZeroPass.dir/build: DivZeroPass.so

.PHONY : CMakeFiles/DivZeroPass.dir/build

CMakeFiles/DivZeroPass.dir/requires: CMakeFiles/DivZeroPass.dir/src/DivZeroAnalysis.cpp.o.requires
CMakeFiles/DivZeroPass.dir/requires: CMakeFiles/DivZeroPass.dir/src/Transfer.cpp.o.requires
CMakeFiles/DivZeroPass.dir/requires: CMakeFiles/DivZeroPass.dir/src/ChaoticIteration.cpp.o.requires
CMakeFiles/DivZeroPass.dir/requires: CMakeFiles/DivZeroPass.dir/src/Domain.cpp.o.requires
CMakeFiles/DivZeroPass.dir/requires: CMakeFiles/DivZeroPass.dir/src/Utils.cpp.o.requires

.PHONY : CMakeFiles/DivZeroPass.dir/requires

CMakeFiles/DivZeroPass.dir/clean:
	$(CMAKE_COMMAND) -P CMakeFiles/DivZeroPass.dir/cmake_clean.cmake
.PHONY : CMakeFiles/DivZeroPass.dir/clean

CMakeFiles/DivZeroPass.dir/depend:
	cd /DivByZeroChecker/build && $(CMAKE_COMMAND) -E cmake_depends "Unix Makefiles" /DivByZeroChecker /DivByZeroChecker /DivByZeroChecker/build /DivByZeroChecker/build /DivByZeroChecker/build/CMakeFiles/DivZeroPass.dir/DependInfo.cmake --color=$(COLOR)
.PHONY : CMakeFiles/DivZeroPass.dir/depend

