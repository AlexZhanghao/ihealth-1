#ifndef ACTIVECONTROL_H
#define ACTIVECONTROL_H
#include "FTWrapper.h"
#include "matrix.h"
#include "control_card.h"
#include "boundarydetection.h"

class ActiveControl {
public:
    ActiveControl();
    ~ActiveControl();

    void StartMove();
    void StopMove();
	// 采集一次六维力的数据，计算出电机速度，然后指示电机以这个速度运动.这是一轮循环
	void Step();
	bool IsFire();
	//获取机器人末端位置
	void CalculatePlaneXY(short Axis_X, short Axis_Y, double XY[2]);
	void SetDamping(float FC=0.1);

public:
	bool is_exit_thread_;
	bool is_moving_;
	double six_dimension_offset_[6];

private:
	void MoveInNewThread();
	void ExitMoveThread();
	void ActMove();
	//将原始值进行坐标变换
	void Raw2Trans(double RAWData[6], double DistData[6]);
	//将转换后的值进行滤波-二阶巴特沃斯低通滤波器
	void Trans2Filter(double TransData[6], double FiltedData[6]);
	void FiltedVolt2Vel(double FiltedData[6]);

private:
    FTWrapper mFTWrapper;
    //力控模式算出的命令速度

    double jAngle[2];
	HANDLE m_hThread;
};

#endif // ACTIVECONTROL_H
