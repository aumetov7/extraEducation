package com.aumetov.extraEducation.repository;

import com.aumetov.extraEducation.domain.School;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

public interface SchoolRepository extends CrudRepository<School, Integer> {
    List<School> findByTag(String tag);

    void delete(School school);

    List<School> findByName(String name);
}
