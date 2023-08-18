package com.multi.cookies.member.controller;

import com.multi.cookies.member.dto.AdminDTO;
import com.multi.cookies.member.service.AdminService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.List;

@Controller
public class AdminController {
    @Autowired
    private AdminService adminservice;

    // 회원 목록 조회
    @RequestMapping("/members")
    public String list(Model model) {
        List<AdminDTO> members = adminservice.getAllMembers();
        model.addAttribute("members", members);
        return "member/members";
    }

    // 회원 상세 조회
    @RequestMapping ("/members/{id}")
    public String view(@PathVariable int id, Model model) {
        AdminDTO member = adminservice.getMemberById(id);
        model.addAttribute("member", member);
        return "member/viewMember";
    }

    // 회원 수정 페이지로 이동
    @RequestMapping("/members/{id}/edit")
    public String edit(@PathVariable int id, Model model) {
        AdminDTO member = adminservice.getMemberById(id);
        model.addAttribute("member", member);
        return "member/editMember";
    }


    // 회원 수정 처리
    @PostMapping("/members/{id}/update")
    public String update(@PathVariable int id, AdminDTO member) {
        adminservice.updateMember(id, member);
        return "redirect:/members";
    }

    // 회원 삭제 처리
    @GetMapping("/members/{id}/delete")
    public String delete(@PathVariable int id) {
        adminservice.deleteMember(id);
        return "redirect:/members";
    }
        /* 회원 생성 페이지로 이동
    @GetMapping("/create")
    public String create() {
        return "createMember";
    }

    // 회원 생성 처리
    @PostMapping("/create")
    public String create(AdminDTO member) {
        adminservice.createMember(member);
        return "redirect:/members";
    } */
}

