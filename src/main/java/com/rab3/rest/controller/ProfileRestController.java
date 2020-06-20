package com.rab3.rest.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.rab3.controller.dto.AppNameId;
import com.rab3.controller.dto.ApplicationVO;
import com.rab3.controller.dto.ProfileDTO;
import com.rab3.service.ProfileService;
import com.rab3.service.SalutationChoiceService;

@RestController
@RequestMapping("/api2")
public class ProfileRestController {
	
	@Autowired
	private ProfileService profileService;
	
	@Autowired
	private SalutationChoiceService salutationChoiceService;
	
	
	@GetMapping("/profiles/choices")
	public List<String> profilesChoices() {
		return salutationChoiceService.findDifferentChoices();
	}
	
	@GetMapping("/profiles/salutations/{choice}")
	public List<String> profilesChoices(@PathVariable String choice) {
		return salutationChoiceService.findSalutationsByChoice(choice);
	}
	
	/**
	 *    /*  {
    		        	  "aid":122,
    		        	   "appname" : "rab3tech"
    		          } */
	/**
	 * @param appNameId
	 * @return
	 */
	
	@DeleteMapping("/dprofiles")
	public ApplicationVO deleteProfileJsonInpit(@RequestBody AppNameId appNameId) {
		profileService.deleteById(appNameId.getAid());
		ApplicationVO applicationVO=new ApplicationVO();
		applicationVO.setCode("O8182");
		applicationVO.setMessage("profile is deleted successfully for aid = "+appNameId.getAid()+" and appname = "+appNameId.getAppname());
		return applicationVO;
	}
	
	@GetMapping("password/email")
	public ApplicationVO findPasswordEmail(@RequestParam("email") String email ) {
		Optional<ProfileDTO> optional=profileService.findPassword(email);
		  ApplicationVO applicationVO=new ApplicationVO();
		  if(optional.isPresent()) {
			  ProfileDTO profileDTO=optional.get();
			  String salutation="Mr.";
			  if(!profileDTO.getGender().equalsIgnoreCase("Male")) {
				  salutation="Ms";
			  }
			  applicationVO.setCode("1");
			  applicationVO.setMessage("Hello "+salutation+" "+profileDTO.getName()+" your password is =>>> : "+profileDTO.getPassword());
		  }else {
			  applicationVO.setCode("0");
			  applicationVO.setMessage("Sorry , who are you sir????");
		  }
		  applicationVO.setEmail(email);
		  return applicationVO;
	}
	
	/***
				 * {
			aid: 1,
			username: "javatech1000@gmail.com",
			password: "test",
			name: "JavaHunk Technologies",
			email: "javahunk2020@gmail.com",
			gender: "Female",
			role: "admin"
			}
	 * @param profileDTO
	 * @param model
	 * @return
	 */
	@PostMapping("/profiles")
	public ApplicationVO registerPostPage(@RequestBody ProfileDTO profileDTO) {
		profileService.persist(profileDTO);
		ApplicationVO applicationVO=new ApplicationVO();
		applicationVO.setCode("O8182");
		applicationVO.setMessage("profile is created ");
		/*{
			"code":"O8182",
			"message":profile is created""
		}*/
		return applicationVO;
	}
	
	@PutMapping("/profiles")
	public ApplicationVO updateProfile(@RequestBody ProfileDTO profileDTO) {
		profileService.updateProfila(profileDTO);
		ApplicationVO applicationVO=new ApplicationVO();
		applicationVO.setCode("O8182");
		applicationVO.setMessage("profile is update ");
		return applicationVO;
	}

	
	//Jackson Mapper or GSON
	@GetMapping("/profiles")
	public List<ProfileDTO> showProfiles() {
		List<ProfileDTO> profileDTOs = profileService.findProfiles();
		return profileDTOs;
	}
	
	//api2/profiles/3
	@GetMapping("/profiles/{pid}")
	public ProfileDTO editProfile(@PathVariable("pid") int gid) {
		ProfileDTO profileDTO = profileService.findProfileById(gid);
		return profileDTO;
	}
	
	@DeleteMapping("/profiles/{pid}")
	public ApplicationVO deleteProfile(@PathVariable("pid") int gid) {
		ApplicationVO applicationVO=new ApplicationVO();
		applicationVO.setCode("O8182");
		applicationVO.setMessage("profile is deleted ");
		return applicationVO;
	}
	
	

}
