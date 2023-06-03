% Parámetros de la imagen
ancho = 500;          % Ancho de la imagen
alto = 500;           % Alto de la imagen
numPlanos = 10;       % Número de planos
colorFondo = [255 255 255];  % Color de fondo (blanco)

% Crear una matriz vacía para la imagen
imagen = uint8(zeros(alto, ancho, 3));

% Calcular la diferencia de tamaño entre los planos
diferenciaTamano = ceil(alto / numPlanos);

% Generar los planos paralelos
for i = 1:numPlanos
    % Calcular el tamaño del plano actual
    tamanoPlano = alto - (i-1) * diferenciaTamano;
    
    % Calcular las coordenadas verticales del plano
    inicio = (alto - tamanoPlano) + 1;
    fin = alto - (i-1) * diferenciaTamano;
    
    % Asignar un color al plano actual
    colorPlano = randi([0 255], 1, 3);
    
    % Crear una matriz auxiliar con el color del plano repetido
    plano = repmat(colorPlano, tamanoPlano, ancho);
    
    % Asignar el color del plano a la imagen
    imagen(inicio:fin, :, 1) = plano(:, :, 1);
    imagen(inicio:fin, :, 2) = plano(:, :, 2);
    imagen(inicio:fin, :, 3) = plano(:, :, 3);
end

% Configurar el color de fondo
imagen(imagen == 0) = colorFondo(1);

% Mostrar la imagen
figure;
imshow(imagen);
title('Planos paralelos ordenados verticalmente');

% Guardar la imagen en un archivo
imwrite(imagen, 'planos_paralelos.png');  % Cambia el nombre y formato del archivo según tus necesidades
