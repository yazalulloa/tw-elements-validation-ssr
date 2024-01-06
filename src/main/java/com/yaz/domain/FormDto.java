package com.yaz.domain;

public class FormDto {

  private final boolean isNew;
  private final boolean isError;

public FormDto(boolean isNew, boolean isError) {
    this.isNew = isNew;
    this.isError = isError;
  }

  public boolean isNew() {
    return isNew;
  }

  public boolean isError() {
    return isError;
  }
}
