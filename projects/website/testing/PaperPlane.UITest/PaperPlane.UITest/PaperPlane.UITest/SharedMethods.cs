using System;
using System.IO;
using System.Reflection;
using System.Linq;
using OpenQA.Selenium;
using System.Runtime.CompilerServices;
using System.Threading;




namespace PaperPlane.UITest
{
    class SharedMethods
    {
        public static void Login(IWebDriver driver)
        {
            Thread.Sleep(5000);   
            driver.FindElement(By.Id("email")).SendKeys("qa.test1@paperplane.com");
            driver.FindElement(By.Id("password")).SendKeys("t3st0rder");
            driver.FindElement(By.Id("login-btn")).Click();
        }


        public static void Login(IWebDriver driver, string user, string password)
        {
            Thread.Sleep(5000);
            driver.FindElement(By.Id("email")).SendKeys(user);
            driver.FindElement(By.Id("password")).SendKeys(password);
            driver.FindElement(By.Id("login-btn")).Click();
        }

        public static void Wait(IWebDriver driver, int seconds)
        {
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(seconds);
        }

      
    }
}
