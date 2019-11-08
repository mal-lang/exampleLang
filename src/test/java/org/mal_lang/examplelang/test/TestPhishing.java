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

public class TestPhishing extends ExampleLangTest {
  private static class PhishingModel {
    public final Network internet = new Network("internet");
    public final Host server = new Host("server");
    public final User alice = new User("Alice");
    public final Password password123 = new Password("password123");

    public PhishingModel() {
      internet.addHosts(server);
      server.addPasswords(password123);
      alice.addPasswords(password123);
    }
  }

  @Test
  public void testPhishing() {
    var model = new PhishingModel();

    var attacker = new Attacker();
    attacker.addAttackPoint(model.internet.access);
    attacker.addAttackPoint(model.alice.attemptPhishing);
    attacker.attack();

    model.server.access.assertCompromisedWithEffort();
  }
}
