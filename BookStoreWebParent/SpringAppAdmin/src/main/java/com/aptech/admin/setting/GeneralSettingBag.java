package com.aptech.admin.setting;

import java.util.List;

import com.aptech.common.entity.setting.Setting;
import com.aptech.common.entity.setting.SettingBag;


public class GeneralSettingBag extends SettingBag {
	public GeneralSettingBag(List<Setting> listSettings) {
		super(listSettings);
	}
	
	public void updateSiteLogo(String value) {
		super.update("SITE_LOGO", value);
	}
}

