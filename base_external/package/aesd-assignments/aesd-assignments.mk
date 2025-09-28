##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

AESD_ASSIGNMENTS_VERSION = master
AESD_ASSIGNMENTS_SITE = git@github.com:brainhasan/assignment3_2.git
AESD_ASSIGNMENTS_SITE_METHOD = git
AESD_ASSIGNMENTS_GIT_SUBMODULES = YES

define AESD_ASSIGNMENTS_BUILD_CMDS
	$(MAKE) -C $(@D)/finder-app CC="$(TARGET_CC)" all
endef

define AESD_ASSIGNMENTS_INSTALL_TARGET_CMDS
	# إنشاء مجلدات الوجهة
	$(INSTALL) -d $(TARGET_DIR)/usr/bin
	$(INSTALL) -d $(TARGET_DIR)/etc/finder-app/conf

	# نسخ ملفات conf
	$(INSTALL) -m 0755 $(@D)/conf/* $(TARGET_DIR)/etc/finder-app/conf/

	# نسخ سكربتات وأدوات assignment
	$(INSTALL) -m 0755 $(@D)/finder-app/writer $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder.sh $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/finder-app/finder-test.sh $(TARGET_DIR)/usr/bin/
	$(INSTALL) -m 0755 $(@D)/tester.sh $(TARGET_DIR)/usr/bin/
endef

$(eval $(generic-package))

