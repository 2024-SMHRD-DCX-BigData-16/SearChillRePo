package com.smhrd.controller;

import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.client.j2se.MatrixToImageConfig;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.smhrd.mapper.MemberMapper;

@Controller
public class QrCodeController {

	@Autowired
	private MemberMapper MemberMapper;

	
	@GetMapping("/qrScan")
	public String qrScan() {
//		@RequestParam String mem_id
		return "QrScan";
	}
	
	@GetMapping("/qrScan/goMain")
	public String qrScanScan() {
//		@RequestParam String mem_id
		return "redirect:Main";
	}

	
    @GetMapping("/qrMain")
    public String qrMain() {
        return "QrMain";
    }


    
    @GetMapping("/qrMake")
    public Object createQrWithCustomColor(@RequestParam String url) throws WriterException, IOException {
        int width = 130;
        int height = 130;

        // ���� ���� (������ QR �ڵ�, ���� ����)
        MatrixToImageConfig config = new MatrixToImageConfig(0xFF000000, 0xFFFFFFFF); // ������ ����, ��� ���(0xFF000000, 0xFFFFFFFF) -> ���� ���� 0x00FFFFFF

        // Quiet Zone ������ ���� Hint Map ����
        Map<EncodeHintType, Object> hints = new HashMap<>();
        hints.put(EncodeHintType.MARGIN, 0);

        BitMatrix matrix = new MultiFormatWriter().encode(url, BarcodeFormat.QR_CODE, width, height, hints);

        try (ByteArrayOutputStream out = new ByteArrayOutputStream();) {
            MatrixToImageWriter.writeToStream(matrix, "PNG", out, config); // config �Ķ���� �߰�
            return ResponseEntity.ok()
                    .contentType(MediaType.IMAGE_PNG)
                    .body(out.toByteArray());
        }
    }
    
    

}