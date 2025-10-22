# C Component Directory

Directory of reusable components/modules for C.

Some repositories under c-components-directory/ are full project source code. Other repositories are integration wrappers for existing external git repositories.

Integration repositories may be used to provide custom configuration options, custom build options or custom patches need to build and integrate the component.

### We do not discriminate on code quality. Everyone is welcome to publish their reusable component here.

### Up-stream projects (applications or other components) have the responsibility of picking and choosing based on their quality and security requirements.

### A component may be as small as you wish or as big as you wish. An component may be of experimental or of prototype status.

### Components of non-public interest are welcome. Even if you are the only user of it.

### Your source code may look like a pile of sh*t, you're still very much welcome to publish it in CCD as long as it builds into a shared library and a static library!

## Component integration file

The integration file is used to integrate a component into a application or and other components.

The integration files lives in the "directory" git repository.

Name format:

\<component name\>.mk

Variables:

## CCD_\<componentname\>_NAME

Required.

The unique name of the component in the CCD universe.

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

