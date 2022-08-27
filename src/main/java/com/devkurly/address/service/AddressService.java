package com.devkurly.address.service;

import com.devkurly.address.domain.AddressDto;

import javax.servlet.http.HttpSession;
import java.util.List;



public interface AddressService {
    int getCount() throws Exception;

    int addrInsert(AddressDto dto) throws Exception;

    List<AddressDto> getListSelect(Integer user_id) throws Exception;

    AddressDto read(Integer addr_id) throws Exception;

    int modify(AddressDto addressDto) throws Exception;

    int modifybaaadr(AddressDto addressDto) throws Exception;

    int modifyDefaultFalse(Integer user_id) throws Exception;

    int modifyDefaultTrue(AddressDto addressDto) throws Exception;

    int remove(AddressDto addressDto) throws Exception;

    int removeAll() throws Exception;

    int minCreate(Integer user_id) throws Exception;

    int chkModifyF(Integer user_id) throws Exception;

    int chkModifyT(AddressDto addressDto) throws Exception;
}
