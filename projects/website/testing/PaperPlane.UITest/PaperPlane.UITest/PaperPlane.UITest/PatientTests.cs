using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using NUnit.Framework;
using OpenQA.Selenium;
using OpenQA.Selenium.Chrome;

namespace PaperPlane.UITest
{
    class PatientTests
    {
        IWebDriver driver;

        [SetUp]
        public void BeforeEachTest()
        {
            driver = new ChromeDriver();
            driver.Navigate().GoToUrl("http://localhost/lucky13/projects/website/src/");
        }

        /**
         * Navigates to Patient list
         *
         * */
        public void NavigatePatientList()
        {
            SharedMethods.Login(driver);
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(5);
            driver.FindElement(By.XPath("/html/body/div[1]/div"));

            //go to search page
            driver.FindElement(By.Id("btnPatients")).Click();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(10);
        }

        public void NavigatePatientProfile()
        {
            driver.FindElement(By.XPath("/html/body/div[2]/div/ul/div/li/a")).Click();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(10);

            //check if in patient profile
            driver.FindElement(By.XPath("/html/body/div[2]/div/div[1]"));
        }

        [Test]
        public void ValidatePatientList()
        {
            NavigatePatientList();
            var patientList = driver.FindElement(By.XPath("/html/body/div[2]/div/ul/div/li"));

            Assert.IsTrue(patientList.Displayed);

        }

        [Test]
        public void ValidateBRAINTest() {

            NavigatePatientList();
            driver.FindElement(By.XPath("/html/body/div[2]/div/ul/div/li"));
            NavigatePatientProfile();

            //click Brain test card
            driver.FindElement(By.XPath("/html/body/div[2]/div/div[3]/div[1]/button/h4")).Click();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(1);

            //click brain test button
            driver.FindElement(By.XPath("/html/body/div[2]/div/div[3]/div[2]/div/span/div/a")).Click();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(10);

            var brainTestPage = driver.FindElement(By.Id("titleBrainTestResults"));

            Assert.IsTrue(brainTestPage.Displayed);
        }

        [Test]
        public void ValidateTremorTest()
        {
            NavigatePatientList();
            driver.FindElement(By.XPath("/html/body/div[2]/div/ul/div/li"));
            NavigatePatientProfile();

            //click tremor test card
            driver.FindElement(By.XPath("/html/body/div[2]/div/div[2]/div[1]/button/h4")).Click();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(1);

            //click tremor test button
            driver.FindElement(By.XPath("/html/body/div[2]/div/div[2]/div[2]/div/p/span/div/a")).Click();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(10);

            var tremorChart = driver.FindElement(By.Id("tremorChart"));

            Assert.IsTrue(tremorChart.Displayed);


        }

        [Test]
        public void ValidateMessaging()
        {
            NavigatePatientList();
            driver.FindElement(By.XPath("/html/body/div[2]/div/ul/div/li"));
            NavigatePatientProfile();

            //click messaging card
            driver.FindElement(By.XPath("/html/body/div[2]/div/div[4]/div[3]/div[1]/button/h4")).Click();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(1);

            //click messaging button
            driver.FindElement(By.XPath("/html/body/div[2]/div/div[4]/div[3]/div[2]/div/span/div/a")).Click();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(10);

            var messageTitle = driver.FindElement(By.Id("messageTitle"));

            Assert.IsTrue(messageTitle.Displayed);

        }

        [Test]
        public void ValidateMedication()
        {
            NavigatePatientList();
            driver.FindElement(By.XPath("/html/body/div[2]/div/ul/div/li"));
            NavigatePatientProfile();

            //click medication card
            driver.FindElement(By.XPath("/html/body/div[2]/div/div[4]/div[1]/button/h4")).Click();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(1);

            //click messaging button
            driver.FindElement(By.XPath("/html/body/div[2]/div/div[4]/div[2]/div/span/div/a")).Click();
            driver.Manage().Timeouts().ImplicitWait = TimeSpan.FromSeconds(10);

            var medicationButton = driver.FindElement(By.Id("create-medication-btn"));

            Assert.IsTrue(medicationButton.Displayed);

        }


        [TearDown]
        public void CleanUp()
        {
            if (driver != null)
            {
                driver.Quit();
            }
        }

    }
}
