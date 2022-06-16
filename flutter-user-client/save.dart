// email
     
      await driver.tap(emailInputField);
      await driver.enterText("efpltest@gmail.com");

      // username
      await driver.tap(userNameInputField);
      await driver.enterText("Efpluser");

      // team name
      await driver.tap(teamNameInputField);
      await driver.enterText("Infotekkers");

      // password
      await driver.tap(passwordInputField);
      await driver.enterText("StrongPass@123456");

      // c password
      await driver.tap(confirmPasswordInputField);
      await driver.enterText("StrongPass@123456");

      // click button
      await driver.tap(signUpButton);

      //
      await driver.waitFor(initialTransferMainKey);
      await driver.waitFor(initialTransferGKKey1);

      // select GK1
      await driver.tap(initialTransferGKKey1);
      await driver.scrollUntilVisible(transferListViewMainView, selectedGK1,
          dyScroll: -100);
      await driver.tap(selectedGK1);
      await driver.tap(transferPlayerCardTransferButton);

      // select gk2
      await driver.tap(initialTransferGKKey2);
      await driver.scrollUntilVisible(transferListViewMainView, selectedGK2,
          dyScroll: -100);
      await driver.tap(selectedGK2);
      await driver.tap(transferPlayerCardTransferButton);

      await Future.delayed(const Duration(seconds: 2));