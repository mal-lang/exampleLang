/*
 * Copyright 2019 Foreseeti AB
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package org.mal_lang.examplelang.test;

import core.Attacker;
import org.junit.jupiter.api.Test;

public class TestGuessPassword extends ExampleLangTest {
  private static class GuessPasswordModel {
    public final Network internet = new Network("internet");
    public final Host server = new Host("server");

    public GuessPasswordModel() {
      internet.addHosts(server);
    }
  }

  @Test
  public void testGuessPassword() {
    var model = new GuessPasswordModel();

    var attacker = new Attacker();
    attacker.addAttackPoint(model.internet.access);
    attacker.addAttackPoint(model.server.guessPassword);
    attacker.attack();

    model.server.access.assertCompromisedWithEffort();
  }
}
