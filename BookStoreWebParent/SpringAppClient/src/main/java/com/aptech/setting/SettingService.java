package com.aptech.setting;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aptech.common.entity.setting.Setting;
import com.aptech.common.entity.setting.SettingCategory;
import com.aptech.customer.EmailSettingBag;

@Service
public class SettingService {
	@Autowired
	private SettingRepository settingRepository;


	public List<Setting> getGeneralSettings() {
		return settingRepository.findByCategories(SettingCategory.GENERAL);
	}
	
	public EmailSettingBag getEmailSettings() {
		List<Setting> settings = settingRepository.findByCategory(SettingCategory.MAIL_SERVER);
		settings.addAll(settingRepository.findByCategory(SettingCategory.MAIL_TEMPLATES));
		
		return new EmailSettingBag(settings);
	}
}
