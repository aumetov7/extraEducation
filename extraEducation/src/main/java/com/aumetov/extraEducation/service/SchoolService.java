package com.aumetov.extraEducation.service;

import com.aumetov.extraEducation.domain.School;
import com.aumetov.extraEducation.repository.SchoolRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class SchoolService {
    @Autowired
    private SchoolRepository schoolRepository;

    public Iterable<School> findAll() {
        return schoolRepository.findAll();
    }

    public void delete(School school) {
        schoolRepository.delete(school);
    }
}
