/*
* Copyright (c) 2013- Facebook.
* All rights reserved.
*/

package codetoanalyze.java.eradicate;

import javax.annotation.Nullable;

import android.annotation.SuppressLint;

public class ParameterNotNullable {

  boolean field = false;

  ParameterNotNullable() {
    testPrimitive(field);
  }

  void testPrimitive(boolean f) {
  }

  void test(String s) {
    int n = s.length();
  }

  void testN(@Nullable String s) {
    int n = s != null ? s.length() : 0;
  }

  void callNull() {
    String s = null;
    test(s);
  }

  @SuppressLint("ERADICATE_PARAMETER_NOT_NULLABLE")
  void callNullSuppressed() {
    String s = null;
    test(s);
  }

  void callNullable(@Nullable String s) {
    test(s);
  }

  void callNullOK() {
    String s = null;
    testN(s);
  }

  void callNullableOK(@Nullable String s) {
    testN(s);
  }

  private ParameterNotNullable(@Nullable String s) {
  }

  class Builder {
    ParameterNotNullable getEradicateParameterNotNullable() {
      return new ParameterNotNullable(null);
    }
  }
}
