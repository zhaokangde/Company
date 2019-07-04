
package com.qq.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.qq.mapper.PictureMapper;
import com.qq.model.Picture;


@Service //expected at least 1 bean which qualifies as autowire candidate.
public class PictureService {

	@Resource
	PictureMapper picturemapper;

	public int  addpicurl(Picture pic) {
		
		return picturemapper.addpicurl(pic);
	}

	

}
