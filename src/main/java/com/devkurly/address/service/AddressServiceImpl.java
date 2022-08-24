package com.devkurly.address.service;

import com.devkurly.address.dao.AddressDao;
import com.devkurly.address.domain.AddressDto;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class AddressServiceImpl implements AddressService {

    private final AddressDao addressDao;

    public AddressServiceImpl(AddressDao addressDao) {
        this.addressDao = addressDao;
    }

    @Override
    public int getCount() throws Exception {
        return addressDao.count();
    }

    @Override
    public int addrInsert(AddressDto addressDto) throws Exception {
        if (addressDto.getChk_addr() == true) {
            addressDao.chkUpdateF(addressDto.getUser_id());
            addressDao.chkUpdateT(addressDto);
        }




        return addressDao.insert(addressDto);
    }

    @Override
    public List<AddressDto> getListSelect(Integer user_id) throws Exception {


        return addressDao.listSelect(user_id);
    }

    @Override
    public AddressDto read(Integer addr_id) throws Exception {
        return addressDao.updateSelect(addr_id);
    }

    @Override
    public int modify(AddressDto addressDto) throws Exception {
        if (addressDto.getChk_addr() == true) {
            addressDao.chkUpdateF(addressDto.getUser_id());
            addressDao.chkUpdateT(addressDto);
        }
            return addressDao.update(addressDto);
    }

    @Override
    public int remove(AddressDto addressDto) throws Exception {
        return addressDao.delete(addressDto);
    }

    @Override
    public int removeAll() throws Exception  {
        return addressDao.deleteAll();
    }

    @Override
    public int minCreate(Integer user_id) throws Exception {
        return addressDao.minInsert(user_id);
    }

    @Override
    public int chkModifyF(Integer user_id) throws Exception {
        return addressDao.chkUpdateF(user_id);
    }

    @Override
    public int chkModifyT(AddressDto addressDto) throws Exception {
        return addressDao.chkUpdateT(addressDto);
    }
}
