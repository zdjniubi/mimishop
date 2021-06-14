package com.zdj.miaoshaproject.util;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Random;

@Service
public class AvatarUtils {
    public static List<String> avatars;
    public static List<String> visitAvatars;
    public AvatarUtils() {
        avatars = new ArrayList<>();
        visitAvatars = new ArrayList<>();
        avatars.add("https://pic4.zhimg.com/80/v2-7d94c477a89e5f8b18d7d177ad8e133f_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic4.zhimg.com/80/v2-fc3d3cd05ead955b33dccf6479535bf8_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic4.zhimg.com/80/v2-2328d3967dfbf425c20cbedb57858bc0_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic4.zhimg.com/80/v2-cffae22f4abe8589ec316070b8d9ea50_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic1.zhimg.com/80/v2-8ec5fd1d95076516d44f9e5511d12737_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic2.zhimg.com/80/v2-5b4ef45f79bbc72721c3461325283def_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic3.zhimg.com/80/v2-6b8f28929f702a3d4f8061a2afd41064_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic1.zhimg.com/80/v2-ddcbdb9f9a6d76f8654a0d440fb471c4_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic1.zhimg.com/80/v2-7df17d8c9e7e810a089327419ab4b172_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic2.zhimg.com/80/v2-6b88a8b945c542ce79155a34f1ac23a5_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic2.zhimg.com/80/v2-a8e5a4a776193e612343ca0e1891aace_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic4.zhimg.com/80/v2-7e2aab3fad79ce93b35eef78950f125c_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic1.zhimg.com/80/v2-3192f38e20d8bf3bb15c955903790b79_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic4.zhimg.com/80/v2-2e77b84bfb7a5c7cc87bde23f010eeb6_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic4.zhimg.com/80/v2-0ebe65bf59117a28745d47b3858e84c7_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic4.zhimg.com/80/v2-9ac9cb054d4d7be76b453126df4ab96a_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic2.zhimg.com/80/v2-1132a87d55b761673ab352e3cca3ecc3_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic2.zhimg.com/80/v2-8c6806867fd3a72e455b4b3c54cb94a4_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic3.zhimg.com/80/v2-6db51c268a8587df3aaf7e28aaa036a5_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic4.zhimg.com/80/v2-aef268306a2f76ba3c9e1ee7c4f8ff71_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic2.zhimg.com/80/v2-ca1e548a21c747781eff05fe74c20a56_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic1.zhimg.com/80/v2-c98552b9af9a7f949fb2bfc6c18ac793_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic1.zhimg.com/80/v2-13422420126ea6de9bc8e6bffe396aaa_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic1.zhimg.com/80/v2-057a1e0363af3dc126b7b9ea3bf7fb78_1440w.jpg?source=1940ef5c");
        avatars.add("https://pic1.zhimg.com/80/v2-4db78cf9037714c170ed7c7b3f466749_1440w.jpg?source=1940ef5c");
        visitAvatars.add("https://ss3.baidu.com/-fo3dSag_xI4khGko9WTAnF6hhy/zhidao/wh%3D450%2C600/sign"
                + "=57e5bea30ffa513d51ff64da085d79cd/43a7d933c895d1436b21cf5c74f082025aaf077d.jpg");
        visitAvatars.add("https://ss0.baidu.com/7Po3dSag_xI4khGko9WTAnF6hhy/zhidao/pic/item"
                + "/37d12f2eb9389b501056cb2d8235e5dde7116e27.jpg");
        visitAvatars.add("https://ss1.bdstatic.com/70cFvXSh_Q1YnxGkpoWK1HF6hhy/it/u=1533264708,1385022343&fm=26&gp=0"
                + ".jpg");

    }

    public String getImageURL() {
        return avatars.get(new Random().nextInt(avatars.size() - 1));
    }
    public String getVistImageURL() {
        return visitAvatars.get(new Random().nextInt(visitAvatars.size() - 1));
    }
}
