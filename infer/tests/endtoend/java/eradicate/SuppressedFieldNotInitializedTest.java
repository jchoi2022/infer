/*
 * Copyright 2013-present Facebook, Inc.
 */

package endtoend.java.eradicate;

import static org.hamcrest.MatcherAssert.assertThat;
import static utils.matchers.ResultContainsNoErrorInMethod.doesNotContain;
import static utils.matchers.ResultContainsExactly.containsExactly;

import org.junit.BeforeClass;
import org.junit.Test;

import java.io.IOException;

import utils.InferException;
import utils.InferResults;

public class SuppressedFieldNotInitializedTest {

  public static final String SOURCE_FILE =
      "infer/tests/codetoanalyze/java/eradicate/SuppressedFieldNotInitializedExample.java";

  public static final String FIELD_NOT_INITIALIZED =
      "ERADICATE_FIELD_NOT_INITIALIZED";

  private static InferResults inferResults;

  @BeforeClass
  public static void loadResults() throws InterruptedException, IOException {
    inferResults = InferResults.loadEradicateResults(
        SuppressedFieldNotInitializedTest.class,
        SOURCE_FILE);
  }

  @Test
  public void matchErrors()
      throws IOException, InterruptedException, InferException {
    String[] methods = {
    };
    assertThat(
        "Results should contain " + FIELD_NOT_INITIALIZED,
        inferResults,
        containsExactly(
            FIELD_NOT_INITIALIZED,
            SOURCE_FILE,
            methods));
  }

}
