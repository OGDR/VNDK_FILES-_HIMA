LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_SRC_FILES := \
    AudioMixer.cpp.arm \
    AudioResampler.cpp.arm \
    AudioResamplerCubic.cpp.arm \
    AudioResamplerSinc.cpp.arm \
    AudioResamplerDyn.cpp.arm \
    BufferProviders.cpp \
    RecordBufferConverter.cpp \

LOCAL_C_INCLUDES := \
    $(TOP) \
    $(call include-path-for, audio-utils) \
    $(LOCAL_PATH)/include \
    
LOCAL_C_INCLUDE_DIRS := $(LOCAL_PATH)\/system/include

LOCAL_SHARED_LIBRARIES := \
	libnbaio \
    libsonic \
	
LOCAL_LDFLAGS += $(call intermediates-dir-for,SHARED_LIBRARIES,libnbaio, libsonic)

LOCAL_ADDITIONAL_DEPENDENCIES := libnbaio libsonic 

LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/include

LOCAL_SHARED_LIBRARIES := \
    libaudiohal \
    libaudioutils \
    libcutils \
    liblog \
    libutils \

LOCAL_MODULE := libaudioprocessing
LOCAL_VENDOR_MODULE := true
LOCAL_CFLAGS := -Werror -Wall

# uncomment to disable NEON on architectures that actually do support NEON, for benchmarking
#LOCAL_CFLAGS += -DUSE_NEON=false

include $(BUILD_SHARED_LIBRARY)

include $(call all-makefiles-under,$(LOCAL_PATH))
