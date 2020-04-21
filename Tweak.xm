@interface SBFluidSwitcherIconImageContainerView : UIView
@end

// スイッチャーの画像
%hook SBFluidSwitcherIconImageContainerView
- (void)layoutSubviews {

    // MSHookIvarについて。
    // https://iphonedevwiki.net/index.php/Hooking_Instance_Variables

    UIImageView *imageView = MSHookIvar<UIImageView *>(self,"_imageView");

    // UIImageView *imageView は無くても self で問題ない。
    // borderWidth等をを使う時には変数宣言すると楽。

    // 元の処理を実行
    %orig;

    // height/2で角を綺麗な丸にすることができる。
    imageView.layer.cornerRadius = self.frame.size.height/2;

    // clipsToBoundsはYESにしないと角の変更ができない。
    // 角をいじった時に反映されないのはこいつをYESにしてない
    // ことが多いと思う。
    imageView.clipsToBounds = YES;


    // スイッチャー画面のアプリアイコンの大きさと位置調整

    // imageView.frame = CGRectMake(39, 0, 26, 26);

    // CGRectMakeで検索すれば詳しいことは出てくると思います。

}
%end