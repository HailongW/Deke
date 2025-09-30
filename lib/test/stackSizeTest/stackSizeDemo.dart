import 'package:flutter/material.dart';

class StackSizeDemo extends StatelessWidget {
  const StackSizeDemo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Stack 尺寸计算示例')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 示例 1：仅包含未定位子组件
            _buildSection(
              title: '1. 仅未定位子组件',
              description: 'Stack 尺寸 = 最大子组件尺寸（200x200）',
              child: Stack(
                // 用灰色背景显示 Stack 实际大小
                children: [
                  Container(width: 100, height: 100, color: Colors.red),
                  Container(
                      width: 200,
                      height: 200,
                      color: Colors.green.withOpacity(0.5)),
                ],
              ),
            ),

            // 示例 2：包含定位与未定位子组件
            _buildSection(
              title: '2. 混合定位与未定位子组件',
              description: 'Stack 尺寸由未定位子组件决定（150x150），定位组件不影响',
              child: Stack(
                children: [
                  // 未定位组件：决定 Stack 尺寸
                  Container(
                      width: 150,
                      height: 150,
                      color: Colors.blue.withOpacity(0.5)),
                  // 定位组件：仅定位，不影响 Stack 尺寸
                  const Positioned(
                    top: 100,
                    left: 100,
                    child: SizedBox(
                        width: 100,
                        height: 100,
                        child: ColoredBox(color: Colors.yellow)),
                  ),
                ],
              ),
            ),

            // 示例 3：Stack 固定尺寸
            _buildSection(
              title: '3. Stack 固定尺寸',
              description: 'Stack 强制设置为 200x200，子组件超出部分默认裁剪',
              child: Container(
                width: 200,
                height: 200,
                color: Colors.grey[200],
                child: Stack(
                  // overflow: Overflow.visible, // 取消注释可允许子组件超出显示
                  children: [
                    Container(
                        width: 300,
                        height: 300,
                        color: Colors.purple.withOpacity(0.5)),
                  ],
                ),
              ),
            ),

            // 示例 4：Positioned 同时设置 left 和 right
            _buildSection(
              title: '4. Positioned 同时设置 left 和 right',
              description: '定位组件强制宽=100（right-left），间接影响 Stack 尺寸',
              child: const Stack(
                children: [
                  Positioned(
                    left: 50,
                    right: 50, // 宽 = 父容器宽 - left - right（此处父容器宽由该组件决定）
                    height: 100,
                    child: ColoredBox(color: Colors.orange),
                  ),
                ],
              ),
            ),

            // 示例 5：嵌套 Stack
            _buildSection(
              title: '5. 嵌套 Stack',
              description: '内层 Stack 尺寸由自身子组件决定，与外层独立',
              child: Stack(
                children: [
                  // 外层未定位组件：决定外层 Stack 尺寸（300x200）
                  Container(
                      width: 300,
                      height: 200,
                      color: Colors.teal.withOpacity(0.3)),
                  // 内层 Stack
                  const Positioned(
                    top: 50,
                    left: 50,
                    child: Stack(
                      children: [
                        // 内层未定位组件：决定内层 Stack 尺寸（150x100）
                        ColoredBox(
                            color: Colors.pink,
                            child: SizedBox(width: 150, height: 100)),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 封装展示区域
  Widget _buildSection({
    required String title,
    required String description,
    required Widget child,
  }) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          Text(description,
              style: const TextStyle(color: Colors.grey, fontSize: 14)),
          const SizedBox(height: 12),
          // 用边框显示 Stack 容器范围
          Container(
            decoration:
                BoxDecoration(border: Border.all(color: Colors.black12)),
            child: child,
          ),
        ],
      ),
    );
  }
}
