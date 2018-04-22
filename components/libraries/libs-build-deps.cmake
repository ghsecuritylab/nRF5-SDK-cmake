#******************************************************************************
#
# Copyright (c) 2018 Siarhei Volkau
# SPDX-License-Identifier: MIT
#
#******************************************************************************

if (NRF5_LIBS MATCHES " nrf-balloc ")
	print_lib_usage(nrf-balloc)
	add_definitions(-DNRF_BALLOC_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/balloc/nrf_balloc.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-bsp ")
	print_lib_usage(nrf-bsp)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/bsp/bsp.c
		${NRF5_SDK_ROOT}/components/libraries/bsp/bsp_nfc.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-bsp-simple " AND NOT(NRF5_LIBS MATCHES " nrf-bsp "))
	print_lib_usage(nrf-bsp-simple)
	add_definitions(-DBSP_SIMPLE)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/bsp/bsp.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-bsp-btn ")
	print_lib_usage(nrf-bsp-btn)
	if (NOT DEFINED NRF5_SOFTDEVICE)
		message(WARNING "nrf-bsp-btn library requires enabled Softdevice -- skipped")
	else()
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/bsp/bsp_btn_ant.c
			${NRF5_SDK_ROOT}/components/libraries/bsp/bsp_btn_ble.c
		)
	endif()
endif()

if (NRF5_LIBS MATCHES " nrf-button ")
	print_lib_usage(nrf-button)
	add_definitions(-DBUTTON_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/button/app_button.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-cli ")
	print_lib_usage(nrf-cli)
	add_definitions(-DNRF_CLI_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/cli/nrf_cli.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-cli-ble-uart ")
	print_lib_usage(nrf-cli-ble-uart)
	# TODO check softdevice provides BLE
	if (NOT DEFINED NRF5_SOFTDEVICE)
		message(WARNING "nrf-cli-ble-uart backend requires enabled Softdevice -- skipped")
	else()
		add_definitions(-DNRF_CLI_BLE_UART_ENABLED=1)
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/cli/ble_uart/nrf_cli_ble_uart.c
		)
	endif()
endif()

if (NRF5_LIBS MATCHES " nrf-cli-cdc-acm ")
	print_lib_usage(nrf-cli-cdc-acm)
	if (NOT(NRF5_TARGET MATCHES "nRF52840"))
		message(WARNING "USB library applicable only to nRF52840 -- skipped")
	else()
		add_definitions(-DNRF_CLI_CDC_ACM_ENABLED=1)
		add_definitions(-DNRF_CLI_CDC_ACM_COMM_EPIN=NRF_DRV_USBD_EPIN2)
		add_definitions(-DNRF_CLI_CDC_ACM_DATA_EPIN=NRF_DRV_USBD_EPIN1)
		add_definitions(-DNRF_CLI_CDC_ACM_DATA_EPOUT=NRF_DRV_USBD_EPOUT1)
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/cli/cdc_acm/nrf_cli_cdc_acm.c
		)
	endif()
endif()

if (NRF5_LIBS MATCHES " nrf-cli-rtt ")
	print_lib_usage(nrf-cli-rtt)
	add_definitions(-DNRF_CLI_RTT_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/cli/rtt/nrf_cli_rtt.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-cli-uart ")
	print_lib_usage(nrf-cli-uart)
	add_definitions(-DNRF_CLI_UART_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/cli/uart/nrf_cli_uart.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-memobj ")
	print_lib_usage(nrf-memobj)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/experimental_memobj/nrf_memobj.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-queue ")
	print_lib_usage(nrf-queue)
	add_definitions(-DNRF_QUEUE_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/queue/nrf_queue.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-pwr-mgmt ")
	print_lib_usage(nrf-pwr-mgmt)
	add_definitions(-DNRF_PWR_MGMT_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/pwr_mgmt/nrf_pwr_mgmt.c
	)
	if (NRF5_LIBS MATCHES " nrf-scheduler ")
		add_definitions(-DNRF_PWR_MGMT_CONFIG_USE_SCHEDULER=1)
	endif()
	if (NRF5_TARGET MATCHES "nRF52810")
		add_definitions(-DNRF_PWR_MGMT_CONFIG_FPU_SUPPORT_ENABLED=0)
	else()
		add_definitions(-DNRF_PWR_MGMT_CONFIG_FPU_SUPPORT_ENABLED=1)
	endif()
endif()

if (NRF5_LIBS MATCHES " nrf-ringbuf ")
	print_lib_usage(nrf-ringbuf)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/experimental_ringbuf/nrf_ringbuf.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-scheduler ")
	print_lib_usage(nrf-scheduler)
	add_definitions(-DAPP_SCHEDULER_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/scheduler/app_scheduler.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-section-vars ")
	print_lib_usage(nrf-section-vars)
	add_definitions(-DNRF_SECTION_ITER_ENABLED=1)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/experimental_section_vars/nrf_section_iter.c
	)
endif()

if (NRF5_LIBS MATCHES " nrf-timer ")
	print_lib_usage(nrf-timer)
	add_definitions(-DAPP_TIMER_ENABLED=1)
	if (NRF5_LIBS MATCHES " freertos ")
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/timer/app_timer_freertos.c
		)
	elseif (NRF5_LIBS MATCHES " rtx ")
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/timer/app_timer_rtx.c
		)
	else()
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/timer/app_timer.c
		)
	endif()
endif()

if (NRF5_LIBS MATCHES " nrf-usbd ")
	print_lib_usage(nrf-usbd)
	if (NOT(NRF5_TARGET MATCHES "nRF52840"))
		message(WARNING "USB library applicable only to nRF52840 -- skipped")
	else()
		add_definitions(-DAPP_USBD_ENABLED=1)
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/usbd/app_usbd.c
			${NRF5_SDK_ROOT}/components/libraries/usbd/app_usbd_core.c
			${NRF5_SDK_ROOT}/components/libraries/usbd/app_usbd_string_desc.c
		)
	endif()
endif()

if (NRF5_LIBS MATCHES " nrf-usbd-class-audio ")
	print_lib_usage(nrf-usbd-class-audio)
	if (NOT(NRF5_TARGET MATCHES "nRF52840"))
		message(WARNING "USB library applicable only to nRF52840 -- skipped")
	else()
		add_definitions(-DAPP_USBD_CLASS_AUDIO_ENABLED=1)
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/usbd/class/audio/app_usbd_audio.c
		)
	endif()
endif()

if (NRF5_LIBS MATCHES " nrf-usbd-class-cdc ")
	print_lib_usage(nrf-usbd-class-cdc)
	if (NOT(NRF5_TARGET MATCHES "nRF52840"))
		message(WARNING "USB library applicable only to nRF52840 -- skipped")
	else()
		add_definitions(-DAPP_USBD_CLASS_CDC_ACM_ENABLED=1)
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/usbd/class/cdc/acm/app_usbd_cdc_acm.c
		)
	endif()
endif()

if (NRF5_LIBS MATCHES " nrf-usbd-class-hid ")
	print_lib_usage(nrf-usbd-class-hid)
	if (NOT(NRF5_TARGET MATCHES "nRF52840"))
		message(WARNING "USB library applicable only to nRF52840 -- skipped")
	else()
		add_definitions(-DAPP_USBD_CLASS_HID_ENABLED=1)
		set(NRF5_SOURCES ${NRF5_SOURCES}
			${NRF5_SDK_ROOT}/components/libraries/usbd/class/hid/app_usbd_hid.c
		)
	endif()
endif()

if (NRF5_LIBS MATCHES " nrf-utils ")
	print_lib_usage(nrf-utils)
	set(NRF5_SOURCES ${NRF5_SOURCES}
		${NRF5_SDK_ROOT}/components/libraries/util/app_error.c
		${NRF5_SDK_ROOT}/components/libraries/util/app_error_weak.c
		${NRF5_SDK_ROOT}/components/libraries/util/app_util_platform.c
		${NRF5_SDK_ROOT}/components/libraries/util/nrf_assert.c
		${NRF5_SDK_ROOT}/components/libraries/util/sdk_mapped_flags.c
	)
endif()
