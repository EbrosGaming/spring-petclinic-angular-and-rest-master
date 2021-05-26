package org.springframework.samples.petclinic.model;

import org.junit.Test;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.DisplayName;

import java.util.HashSet;
import java.util.Set;

public class VetTest {
    Vet vetObject;
    Specialty specialty1= new Specialty();
    Specialty specialty2= new Specialty();
    Specialty specialty3= new Specialty();


    public VetTest(){
        initVet();
    }
    @BeforeEach
    void initVet() {
        vetObject = new Vet();
    }
    @AfterEach
    void teardown() {
        vetObject=null;
    }

    @Test
    @DisplayName("Test To Get No Of Specialties")
    public void getNrOfSpecialtiesTest() {
        vetObject.addSpecialty(specialty1);
        Assertions.assertEquals(1, vetObject.getNrOfSpecialties());
    }
    @Test
    @DisplayName("Test To Add Specialties")
    public void addSpecialtiesTest() {
        vetObject.addSpecialty(specialty1);
        vetObject.addSpecialty(specialty2);
        Assertions.assertEquals(2, vetObject.getNrOfSpecialties());
    }
    @Test
    @DisplayName("Test To ClearSpecialties")
    public void clearSpecialtiesTest() {
        vetObject.addSpecialty(specialty2);
        vetObject.addSpecialty(specialty3);
        vetObject.clearSpecialties();
        Assertions.assertEquals(0, vetObject.getNrOfSpecialties());
    }
    @Test
    @DisplayName("Test To Set Internal Specialties")
    public void setSpecialtiesInternalTest() {
        Set<Specialty> specialtiesSet=new HashSet<> ();
        specialtiesSet.add(specialty1);
        specialtiesSet.add(specialty2);
        vetObject.setSpecialtiesInternal(specialtiesSet);
        Assertions.assertEquals(2, vetObject.getSpecialtiesInternal().size());
        System.out.println(vetObject.getSpecialtiesInternal().size());
    }
    @Test
    @DisplayName("Test To Get Specialties Internal")
    public void getSpecialtiesInternalTest() {
        Set<Specialty> specialtiesSet=new HashSet<> ();
        specialtiesSet.add(specialty1);
        vetObject.setSpecialtiesInternal(specialtiesSet);
        Assertions.assertEquals(1, vetObject.getSpecialtiesInternal().size());
        System.out.println(vetObject.getSpecialtiesInternal().size());
    }
    @Test
    @DisplayName("Test To getSpecialties")
    public void getSpecialtiesTest() {
        vetObject.addSpecialty(specialty1);
        vetObject.addSpecialty(specialty2);
        vetObject.addSpecialty(specialty3);
        Assertions.assertEquals(3, vetObject.getSpecialties().size());
        System.out.println(vetObject.getSpecialties().size());
    }



}
