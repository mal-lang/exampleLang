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
package com.foreseeti.test.examplelang;

import core.Asset;
import core.AttackStep;
import core.Attacker;
import core.Defense;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.Test;

public class TestExampleLang {
  @Test
  public void testSSHAccess() {
    var user = new User("Alice");
    var pass = new Password("password123");
    var host = new Host("server");

    user.addHosts(host);
    user.addPasswords(pass);
    host.addPasswords(pass);

    var attacker = new Attacker();
    attacker.addAttackPoint(user.compromise);
    attacker.addAttackPoint(pass.obtain);
    attacker.attack();

    host.sshAccess.assertCompromisedInstantaneously();
  }

  @Test
  public void testNotSSHAccess() {
    var user = new User("Alice");
    var pass = new Password("password123");
    var host = new Host("server");

    user.addHosts(host);
    user.addPasswords(pass);
    host.addPasswords(pass);

    var attacker = new Attacker();
    attacker.addAttackPoint(user.compromise);
    attacker.attack();

    host.sshAccess.assertUncompromised();
  }

  @AfterEach
  public void deleteModel() {
    Asset.allAssets.clear();
    AttackStep.allAttackSteps.clear();
    Defense.allDefenses.clear();
  }
}
