function basic_global_thresholding(diretorio_categoria, imagem, T, maiorValor, deltaT, numImagem)
%     imagem = imcrop(imagem,[337 316 1312 554]);
%     imagem = imadjust(imagem, [0 1], [1 0]);
%  imagem = imadjust(imagem, stretchlim(imagem), [1 0]);
    % Diret�rio para gravar as imagens segmentadas
%     dir_basic_global_thresholding = [diretorio_categoria 'segmentadas\thresholding\global_thresholding\'];
    % Diret�rio para gravar as imagens segmentadas considerando apenas o
    % ROI obtido
    dir_basic_global_thresholding_roi = [diretorio_categoria 'segmentadas\thresholding\global_thresholding\roi_automatico\'];
    count = 0;
    done = false;
    while ~done
        count = count + 1;
        imgSegmentada = imagem > T;
        Tnext = 0.5*(mean(imagem(imgSegmentada)) + mean(imagem(~imgSegmentada)));
        done = abs(T - Tnext) < deltaT;
        T = Tnext;
    end
%     count
    T
    deltaT
    imgSegmentada = im2bw(imagem, T/maiorValor); % 222 � o Maior Valor de itensidade dos pixels da imagem
%     result = double(imgSegmentada) .* regiaoInteresse;
    imshow(imagem) % Imagem original
%     figure, imhist(imagem) % Histograma da Imagem
    figure, imshow(imgSegmentada) % Imagem segmentada por basic_global_thresholding
%     figure, imshow(result) % Exibi��o da Imagem segmentada considerando apenas a gegi�o de interesse

      % Gravo as imagens segmentadas no diret�rio especificado
%       imwrite(imgSegmentada,[dir_basic_global_thresholding,num2str(numImagem),'.bmp'],'bmp');
      % Gravo o ROI das imagens segmentadas no diret�rio especificado
%       imwrite(imgSegmentada,[dir_basic_global_thresholding_roi,num2str(numImagem),'.bmp'],'bmp');
end


