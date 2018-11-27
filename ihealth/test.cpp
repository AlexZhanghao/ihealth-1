#include "stdafx.h"
#include "cmockery.h"
#include "RFMySQLThread.h"
#include "RFMainWindow.h"

RFMainWindow* s_pFrame = NULL;
void test_login_1(void **state)
{
	LoginInfo *pLoginInfo = new LoginInfo;
	pLoginInfo->usrname = _T("test");
	pLoginInfo->usrpwd = _T("test");
	pLoginInfo->role = 2;

	CTask::Assign(CTask::NotWait, Panic(), pLoginInfo, EventHandle(&RFMySQLThread::Login), RFMainWindow::UIThread, RFMainWindow::DBThread);
}

 
void test_entrymainpage_2(void **state)
{
	TNotifyUI msg;
	msg.sType = _T("click");
	s_pFrame->OnEntry(&msg);
}


void test_selectpatientpage_3(void **state)
{
	s_pFrame->ShowSelectPatientPage();

}

void test_managerpatientpage_4(void **state)
{
	s_pFrame->ShowManagerPatientPage();

}

void test_trainpatientpage_5(void **state)
{
	s_pFrame->ShowTrainPage();

}

void test_traininfopage_6(void **state)
{
	s_pFrame->ShowPatientTrainInformation();

}

void test_evaluationpage_7(void **state)
{
	s_pFrame->ShowEvaluationPage();

}

void test_aboutpage_7(void **state)
{
	s_pFrame->ShowAboutPage();

}

void test_selectpatient_3(void **state)
{
	

}



void  test()
{
	/*
	const UnitTest tests[] =
	{
		unit_test(test_login_1),
		unit_test(test_entrymainpage_2),
		unit_test(test_selectpatient_3),
	};*/
	//run_tests(tests);
}
