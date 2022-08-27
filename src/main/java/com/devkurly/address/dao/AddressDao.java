package com.devkurly.address.dao;

import com.devkurly.address.domain.AddressDto;

import javax.servlet.http.HttpSession;
import java.util.List;

public interface AddressDao {

    int count() throws Exception;

    int insert(AddressDto addressDto) throws Exception;

    List<AddressDto> listSelect(Integer user_id) throws Exception;

    AddressDto updateSelect(Integer addr_id) throws Exception;

    int update(AddressDto addressDto) throws Exception;

    int updateDef(AddressDto addressDto) throws Exception;

    int updateDefaultFalse(Integer user_id) throws Exception;

    int updateDefaultTrue(AddressDto addressDto) throws Exception;

    int delete(AddressDto addressDto) throws Exception;

    int deleteAll() throws Exception;

    int minInsert(Integer user_id) throws Exception;

    int chkUpdateF(Integer user_id) throws Exception;

    int chkUpdateT(AddressDto addressDto) throws Exception;
}
