package com.devkurly.product.domain;

import java.util.Objects;

public class MainSubCatDto {
   private String cd_type_id;
   private String cd_type_name;
   private String cd_name_num;
   private String cd_name;

   public MainSubCatDto(String cd_type_id, String cd_type_name, String cd_name_num, String cd_name) {
      this.cd_type_id = cd_type_id;
      this.cd_type_name = cd_type_name;
      this.cd_name_num = cd_name_num;
      this.cd_name = cd_name;
   }

   public String getCd_type_id() {
      return cd_type_id;
   }

   public void setCd_type_id(String cd_type_id) {
      this.cd_type_id = cd_type_id;
   }

   public String getCd_type_name() {
      return cd_type_name;
   }

   public void setCd_type_name(String cd_type_name) {
      this.cd_type_name = cd_type_name;
   }

   public String getCd_name_num() {
      return cd_name_num;
   }

   public void setCd_name_num(String cd_name_num) {
      this.cd_name_num = cd_name_num;
   }

   public String getCd_name() {
      return cd_name;
   }

   public void setCd_name(String cd_name) {
      this.cd_name = cd_name;
   }

   @Override
   public boolean equals(Object o) {
      if (this == o) return true;
      if (!(o instanceof MainSubCatDto)) return false;
      MainSubCatDto that = (MainSubCatDto) o;
      return cd_type_id.equals(that.cd_type_id) && cd_type_name.equals(that.cd_type_name) && cd_name_num.equals(that.cd_name_num) && cd_name.equals(that.cd_name);
   }

   @Override
   public int hashCode() {
      return Objects.hash(cd_type_id, cd_type_name, cd_name_num, cd_name);
   }

   @Override
   public String toString() {
      return "MainSubCategory{" +
              "cd_type_id='" + cd_type_id + '\'' +
              ", cd_type_name='" + cd_type_name + '\'' +
              ", cd_name_num='" + cd_name_num + '\'' +
              ", cd_name='" + cd_name + '\'' +
              '}';
   }
}
