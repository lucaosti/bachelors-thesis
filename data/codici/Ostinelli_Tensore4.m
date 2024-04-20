[righe, colonne] = size(image);

% Struttura
occorrenze = zeros(num_passi_c, num_passi_b, 
                   num_passi_a, num_passi_d);

% Parametri della curva
for a_idx = min_a:passo_a:max_a
    for d_idx = min_d:max_d
        % Calcola tutte le y in funzione di x
        y = zeros(1,2*colonne+1);
        for x = -colonne:colonne
            y(x+colonne+1) = round(-d_idx*((
            (exp(a_idx*x))/(1+exp(a_idx*x)))-0.5));
        end

        % Prova la curva generata per ogni pixel
        for b_idx = 1:num_passi_b
            for c_idx = 1:num_passi_c

                contatore = 0;
                
                for x = 1:colonne
                    riga = c_idx+y(x-b_idx+colonne+1);
                    if riga > 0 && riga <= righe
                        if image(riga, x) == 0
                            contatore = contatore + 1;
                        end
                    end
                end
                occorrenze(c_idx, b_idx, a_idx, d_idx) = 
                        contatore;
            end
        end
    end
end