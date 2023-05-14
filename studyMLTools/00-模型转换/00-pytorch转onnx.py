# 定义一个PyTorch模型并将其保存为ONNX格式的示例代码
# 我们首先定义了一个简单的神经网络模型 SimpleModel。然后使用 torch.onnx.export 方法将该模型转换为 ONNX 格式文件 "simple_model.onnx"。
# 要正确定义模型，我们首先需要导入 PyTorch 的 NN 模块，并创建 SimpleModel 类。
# 构造函数中包含三个层：两个线性层 fc1  和 fc2 , 以及一个 ReLU 激活函数层。
# forward 函数执行正向传递，该函数将输入张量传递到两个线性层，在第一次的输出结果中加上 ReLU 激活功能。
# 接下来，我们创建一个大小为 [1, 10] 的示例输入张量 input_tensor。
# 然后，我们实例化 SimpleModel 并使用 input_tensor 执行了前向传递，并得到了 output_tensor 输出张量。
# 最后，我们调用 torch.onnx.export 方法


import torch
import torch.nn as nn
import torch.onnx

# 定义一个简单模型
class SimpleModel(nn.Module):
    def __init__(self, input_size, hidden_size, output_size):
        super().__init__()
        self.fc1 = nn.Linear(input_size, hidden_size)
        self.relu = nn.ReLU()
        self.fc2 = nn.Linear(hidden_size, output_size)

    def forward(self, x):
        out = self.fc1(x)
        out = self.relu(out)
        out = self.fc2(out)
        return out

# 创建示例输入数据张量
input_tensor = torch.randn(1, 10) # 假设输入数据为大小为[1，10]的张量

# 实例化和训练模型
model = SimpleModel(input_size=10, hidden_size=20, output_size=5)
output_tensor = model(input_tensor)

# 将模型保存为ONNX格式
torch.onnx.export(model, input_tensor, "simple_model.onnx")
