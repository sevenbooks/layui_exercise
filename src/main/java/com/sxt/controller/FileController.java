package com.sxt.controller;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.sxt.utils.AppFileUtils;
import com.sxt.utils.RandomUtils;

/**
 * 文件上传
 * @author LJH
 *
 */
@Controller
@RequestMapping("file")
public class FileController {
	/**
	 * 文件上传
	 * 上传一个文件保存到E://upload
	 * @throws IOException 
	 */
	@RequestMapping("upload")
	@ResponseBody
	public  Map<String,Object>  upload03(MultipartFile mf, String id, String tablename, HttpServletRequest request) throws IOException {
		System.out.println("进入upload方法");
		System.out.println(mf);
		System.out.println(mf.getContentType());//文件的类型
		System.out.println(mf.getName());//表单的name属性值
		System.out.println(mf.getOriginalFilename());//文件名
		System.out.println(mf.getSize());//文件大小
		System.out.println(mf.getInputStream());//文件流
		System.out.println("liaiqiu:" + request.getParameter("liaiqiu"));
		System.out.println("yanghelin:" + request.getParameter("yanghelin"));
		//文件上传的父目录
		String parentPath=AppFileUtils.PATH;
		//得到当前日期作为文件夹名称
		String dirName=RandomUtils.getCurrentDateForString();
		//构造文件夹对象
		File dirFile=new File(parentPath,dirName);
		if(!dirFile.exists()) {
			dirFile.mkdirs();//创建文件夹
		}
		//得到文件原名
		String oldName=mf.getOriginalFilename();
		//根据文件原名得到新名
		String newName=RandomUtils.createFileNameUseTime(oldName);
		File dest=new File(dirFile,newName);
		mf.transferTo(dest);

		// 由于layui要求上传接口返回的数据格式必须是一下这种json类型的(文档地址:https://www.layui.com/doc/modules/upload.html#options),
		// 所以我们就只能按照它的要求构造一个啦
		 Map<String,Object> map=new HashMap<>();
		 map.put("code", 0);
		 map.put("msg", "");
		 Map<String,Object> data=new HashMap<>();
		 data.put("src", "file/downloadFile.action?path="+dirName+"/"+newName);
		 map.put("data", data);
		return map;
	}
	
	

	/**
	 * 下载的方法
	 */
	@RequestMapping("downloadFile")
	public ResponseEntity<Object> downloadFile(String path,HttpServletResponse response){
		//3,拿到文件的老名字
		return AppFileUtils.downloadFile(response, path, "");
	}

}
