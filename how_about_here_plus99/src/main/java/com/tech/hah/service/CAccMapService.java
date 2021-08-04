package com.tech.hah.service;

import java.util.ArrayList;


import com.tech.hah.dto.CAccommodationDto;

public class CAccMapService{
	

	public String getJSON(ArrayList<CAccommodationDto> dtos)  {
		StringBuffer result = new StringBuffer("");
		result.append("{\"result\":[");
		for(int i=0;i<dtos.size();i++) {
			result.append("[{\"acc_code\": " + dtos.get(i).getAcc_code() + "},");
			result.append("{\"acc_name\": \"" + dtos.get(i).getAcc_name() + "\"},");
			result.append("{\"acc_latitude\": " + dtos.get(i).getAcc_latitude() + "},");
			result.append("{\"acc_longitude\": " + dtos.get(i).getAcc_longitude() + "},");
			result.append("{\"acc_price\": " + dtos.get(i).getRoom_price() + "},");
			if(i==dtos.size()-1) {
			result.append("{\"acc_type\": \"" + dtos.get(i).getAcc_type() + "\"}]");	}
			else {
				result.append("{\"acc_type\": \"" + dtos.get(i).getAcc_type() + "\"}],");
			}
		}
		
		result.append("]}");
		return result.toString();
		
	}

}
