package com.tech.hah.dao;

import java.util.ArrayList;

import com.tech.hah.dto.AccommodationDto;
import com.tech.hah.dto.CAccommodationDto;

public interface HDao {
	public ArrayList<AccommodationDto> hotel(String content_order, String hotel);
	public ArrayList<CAccommodationDto> motel();
	
}
