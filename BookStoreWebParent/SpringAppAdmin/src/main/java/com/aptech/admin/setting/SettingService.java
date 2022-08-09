package com.aptech.admin.setting;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.aptech.common.entity.setting.Setting;
import com.aptech.common.entity.setting.SettingCategory;

@Service
public class SettingService {
	@Autowired
	private SettingRepository settingRepository;

	public List<Setting> listAllSetting() {
		return (List<Setting>) settingRepository.findAll();
	}

	public GeneralSettingBag getGeneralSettings() {
		List<Setting> settings = new ArrayList<>();

		List<Setting> generalSettings = settingRepository.findByCategory(SettingCategory.GENERAL);

		settings.addAll(generalSettings);

		return new GeneralSettingBag(settings);
	}

	public void saveAll(Iterable<Setting> settings) {
		settingRepository.saveAll(settings);
	}

	public List<Setting> getMailServerSettings() {
		return settingRepository.findByCategory(SettingCategory.MAIL_SERVER);
	}

	public List<Setting> getMailTemplateSettings() {
		return settingRepository.findByCategory(SettingCategory.MAIL_TEMPLATES);
	}
}
