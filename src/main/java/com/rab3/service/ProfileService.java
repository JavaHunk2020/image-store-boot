package com.rab3.service;

import java.util.List;
import java.util.Optional;

import com.rab3.controller.dto.ProfileDTO;

public interface ProfileService {

	public Optional<ProfileDTO> findPassword(String email);

	String persist(ProfileDTO profileDTO);

	ProfileDTO findProfileById(int aid);

	String updateProfila(ProfileDTO profileDTO);

	List<ProfileDTO> findProfiles();

	byte[] findPhotoById(int aid);

	ProfileDTO auth(String username, String password);

	long findCounts();

	void deleteById(int aid);

}
