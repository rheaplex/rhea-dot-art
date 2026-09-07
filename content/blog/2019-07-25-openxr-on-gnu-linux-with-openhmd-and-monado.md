+++
title = "OpenXR on GNU/Linux With OpenHMD and Monado"
date = 2019-07-25 19:56:42+00:00
path = "/2019/07/25/openxr-on-gnu/linux-with-openhmd-and-monado/"

[taxonomies]
categories = [
    "Free Software",
    "Virtual Reality",
]

[extra]
mf2_syndication = [
    "a:0:{}",
]
+++

With the release of Debian 10, it is possible to build Monado on Debian in order to use the OpenXR SDK with headsets supported by OpenHMD.

Hopefully this means a future OpenXR-enabled Firefox will work with them as well.

In the meantime we can at least run the hello\_xr demo. Here’s how… *(Updated April 2020.)*

Build and install OpenHMD:

<https://github.com/OpenHMD/OpenHMD>

Build and install Monado:

<https://gitlab.freedesktop.org/monado/monado/>

Build and install the OpenXR SDK:

<https://github.com/KhronosGroup/OpenXR-SDK-Source/>

To set the Rift to non-desktop (before each run, if not set in the kernel), run:

`xrandr --output HDMI-0 --prop --set non-desktop 1`

If needed you can check this by running:

`xrandr --prop`

Then to run the OpenXR-SDK hello\_xr demo, run the following in the OpenXR-SDK directory:

`XR_RUNTIME_JSON=/usr/local/share/openxr/1/openxr_monado.json ./build/linux_debug/src/tests/hello_xr/hello_xr -g Vulkan`

Which will show the pocket universe captured in a screenshot the top of this post in your VR headset.