# C Component Directory

### Directory of reusable components/modules for C.

This a C equlient for "pip" in Python, "npm" in NodeJS and Go-build in Golang.

### What is does

Automatically pulls the source of code a project its external git repository.

Builds the source code into a shared library and a static library for consumption of the parent project.



Some repositories under c-components-directory/ are full project source code. Other repositories are integration wrappers for existing external git repositories.

Integration repositories may be used to provide custom configuration options, custom build options or custom patches need to build and integrate the component.

### We do not discriminate on code quality. Everyone is welcome to publish their reusable components in CCD.

### Up-stream projects (applications or other components) have the responsibility of picking and choosing based on their quality and security requirements.

### A component may be as small as you wish or as big as you wish. An component may be of experimental or prototype status.

### Components of non-public interest are welcome. Even if you are the only user of it.

### Your source code may look like a pile of sh*t, you're still very much welcome to publish it in CCD as long as it do build into both a shared library and a static library!

----------

## The component integration file

The integration file is used to integrate a component into a application or and other components.

The integration files lives in the "directory" git repository.

Name format:

\<component name\>.mk

Variables:

## CCD_\<componentname\>_NAME

Required.

The unique name of the component in the CCD universe.

The name must be ascii 7bit lower case letters, digits or the dash character. Capital letters and underscore is not allowed.

The same software may exist as multiple components with different build setting.

CCD_HELLOWORLD_NAME = helloworld

## CCD_\<componentname\>_DESCRIPTION

Required.

One line description of the component.

This is used by the search system "make ccd_search" to list and search among components.

## CCD_\<componentname\>_DEPENDENCIES

Optional.

If the component is have dependencies, the component names are listed here separated by white space.

The CCD build system will automatically pull and build the dependencies prior to building the parent component.

A dependency chain may be infinitely long.

## CCD_\<componentname\>_VERSION

Required.

Either one of:

Git tag of Semantic verion number of format "x.y.z"

Git commit id representing the version.

Used by up-stream project to lock to a specific version of a component.

## CCD_\<componentname\>_MIRROR_1

Required.

URL to a public clonable git repo of the component source code.

Minimum of one git repo must be set. Preferable three or more so the build system are able to pull the component source code.

Infinite amount of source repos may be listed.

Example:

CCD_MYCOMPONENT_MIRROR_1 = https://github.com/C-Component-Directory/helloworld.git

CCD_MYCOMPONENT_MIRROR_2 = git@github.com:C-Component-Directory/helloworld.git

## CCD_\<componentname\>_REQUIRED_OS_NAME

Optional.

One or more operating system ids (uname -s) separated by space.

If a component is dependent on specific operating system syscalls or facilities this is used to indicate compability.

Example:

CCD_MYCOMPONENT_OS_NAME = Darwin

## CCD_\<componentname\>_REQUIRED_OS_RELEASE

Optional.

One or more operating system release ids (uname -r) separated by space.

If the component is dependent on specific operating system release this is used to indicate compability.

Example:

CCD_MYCOMPONENT_OS_RELASE = 24.6.0

## CCD_\<componentname\>_REQUIRED_ARCH

Optional.

One or more Architecture ids (uname -m) separated by space.

If component contains inline assembly code or assembly files for a specific architecture this is used to indicate compability.

Example:

CCD_MYCOMPONENT_ARCH = arm64

# Why CCD?

### Because we love C

### C is the divine language and the lingua franca of UNIX, BSD and Linux

I wanted and needed a way to share reusable C code across projects in a easy and convienant manner. No need to duplicate code in project directories, no need to download and build tarballs or install operating system packages.
