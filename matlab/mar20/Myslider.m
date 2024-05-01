function Myslider
    close all;
    Amplitude = 1;
    Frequency = 1;
    f=figure; %f enables us to handle the figure window
    WS=f.Position;
    a=axes(f);
    a.Position=[0.15,0.15,0.8,0.8]; %15% from the left and 15% from the bottom
    %the laast two arguments and are wifdth and height
    fplot(a,@(x) Amplitude*sin(Frequency*x));%anonymous function
    xlim(a,[-pi,pi]);
    ylim(a,[-2,2]);
    FSlider=uicontrol(f,'Style','slider');
    FSlider.Position=[40,20,WS(3)-60,20]; %lower left corner, width and height
    FSlider.Min=0;
    FSlider.Max=2;
    FSlider.Value=Frequency;
    FSlider.Callback=@Sli;%@FS; %callback functions always take two input arguments
    ASlider=uicontrol(f,'Style','slider');
    ASlider.Position=[20,40,20,WS(4)-60]; %the height of the slider is greater than the width of the slider
    ASlider.Min=0;
    ASlider.Max=2;
    ASlider.Value=Frequency;
    ASlider.Callback=@Sli;%@AS;
    %{
    function FAS(obj,~) %the obj to which the function belongs, ~ a place function that is not used in the function
        Frequency=obj.Value;
        if obj == ASli
        Amplitude=obj.Value;
        fplot(a,@(x) Amplitude*sin(Frequency*x));%anonymous function
        xlim(a,[-pi,pi]);
        ylim(a,[-2,2]);
    end
    function AS(obj,~)
        Amplitude=obj.Value;
        fplot(a,@(x) Amplitude*sin(Frequency*x));%anonymous function
        xlim(a,[-pi,pi]);
        ylim(a,[-2,2]);
    end
    %}
    function Sli(~,~)
        fplot(a,@(x) ASlider.Value*sin(FSlider.Value*x));%anonymous function
        xlim(a,[-pi,pi]);
        ylim(a,[-2,2]);
    end
end