function [finalTable] = regionGrowingLESH(data,tableOfActualCon)
    breastImds=imageDatastore(data);
    %reading the data of actual condition 
    condition=tableOfActualCon(:,2);
    condition=table2array(condition);
    final = {};
    j = 1;

    %loop through the images
    while(hasdata(breastImds))
        I = read(breastImds);
        I=pre_process(I);
        I = im2gray(I);
        I = double(I);
        Seeds = [180];
        SI = I == Seeds;
        T = 30;
        TI = false(size(I));

        for i = 1:length(Seeds)
            seed_val = Seeds(i);
            S = abs(I-seed_val) <= T;
            TI = TI | S;
        end

        IM = imreconstruct(SI,TI);
        [lesh] = calc_LESH(IM);
        lesh = num2cell(lesh);
        newRow = [lesh condition(j,1)];
        disp(condition(j,1))
        final = [final;newRow];
        j = j+1;
    end

    Table = cell2table(final);
    Table.Properties.VariableNames = {'final_1','final_2','final_3','final_4','final_5','final_6','final_7','final_8',...
    'final_9','final_10','final_11','final_12','final_13','final_14','final_15','final_16','final_17','final_18','final_19',...
    'final_20','final_21','final_22','final_23','final_24','final_25','final_26','final_27','final_28','final_29','final_30',...
    'final_31','final_32','final_33','final_34','final_35','final_36','final_37','final_38','final_39','final_40','final_41',...
    'final_42','final_43','final_44','final_45','final_46','final_47','final_48','final_49','final_50','final_51','final_52',...
    'final_53','final_54','final_55','final_56','final_57','final_58','final_59','final_60','final_61','final_62','final_63',...
    'final_64','final_65','final_66','final_67','final_68','final_69','final_70','final_71','final_72','final_73','final_74',...
    'final_75','final_76','final_77','final_78','final_79','final_80','final_81','final_82','final_83','final_84','final_85',...
    'final_86','final_87','final_88','final_89','final_90','final_91','final_92','final_93','final_94','final_95','final_96',...
    'final_97','final_98','final_99','final_100','final_101','final_102','final_103','final_104','final_105','final_106',...
    'final_107','final_108','final_109','final_110','final_111','final_112','final_113','final_114','final_115','final_116',...
    'final_117','final_118','final_119','final_120','final_121','final_122','final_123','final_124','final_125','final_126',...
    'final_127','final_128','final_129','final_130','final_131','final_132','final_133','final_134','final_135','final_136',...
    'final_137','final_138','final_139','final_140','final_141','final_142','final_143','final_144','final_145','final_146',...
    'final_147','final_148','final_149','final_150','final_151','final_152','final_153','final_154','final_155','final_156',...
    'final_157','final_158','final_159','final_160','final_161','final_162','final_163','final_164','final_165','final_166',...
    'final_167','final_168','final_169','final_170','final_171','final_172','final_173','final_174','final_175','final_176',...
    'final_177','final_178','final_179','final_180','final_181','final_182','final_183','final_184','final_185','final_186',...
    'final_187','final_188','final_189','final_190','final_191','final_192','final_193','final_194','final_195','final_196',...
    'final_197','final_198','final_199','final_200','final_201','final_202','final_203','final_204','final_205','final_206',...
    'final_207','final_208','final_209','final_210','final_211','final_212','final_213','final_214','final_215','final_216',...
    'final_217','final_218','final_219','final_220','final_221','final_222','final_223','final_224','final_225','final_226',...
    'final_227','final_228','final_229','final_230','final_231','final_232','final_233','final_234','final_235','final_236',...
    'final_237','final_238','final_239','final_240','final_241','final_242','final_243','final_244','final_245','final_246',...
    'final_247','final_248','final_249','final_250','final_251','final_252','final_253','final_254','final_255','final_256',...
    'final_257','final_258','final_259','final_260','final_261','final_262','final_263','final_264','final_265','final_266',...
    'final_267','final_268','final_269','final_270','final_271','final_272','final_273','final_274','final_275','final_276',...
    'final_277','final_278','final_279','final_280','final_281','final_282','final_283','final_284','final_285','final_286',...
    'final_287','final_288','final_289','final_290','final_291','final_292','final_293','final_294','final_295','final_296',...
    'final_297','final_298','final_299','final_300','final_301','final_302','final_303','final_304','final_305','final_306',...
    'final_307','final_308','final_309','final_310','final_311','final_312','final_313','final_314','final_315','final_316',...
    'final_317','final_318','final_319','final_320','final_321','final_322','final_323','final_324','final_325','final_326',...
    'final_327','final_328','final_329','final_330','final_331','final_332','final_333','final_334','final_335','final_336',...
    'final_337','final_338','final_339','final_340','final_341','final_342','final_343','final_344','final_345','final_346',...
    'final_347','final_348','final_349','final_350','final_351','final_352','final_353','final_354','final_355','final_356',...
    'final_357','final_358','final_359','final_360','final_361','final_362','final_363','final_364','final_365','final_366',...
    'final_367','final_368','final_369','final_370','final_371','final_372','final_373','final_374','final_375','final_376',...
    'final_377','final_378','final_379','final_380','final_381','final_382','final_383','final_384','final_385','final_386',...
    'final_387','final_388','final_389','final_390','final_391','final_392','final_393','final_394','final_395','final_396',...
    'final_397','final_398','final_399','final_400','final_401','final_402','final_403','final_404','final_405','final_406',...
    'final_407','final_408','final_409','final_410','final_411','final_412','final_413','final_414','final_415','final_416',...
    'final_417','final_418','final_419','final_420','final_421','final_422','final_423','final_424','final_425','final_426',...
    'final_427','final_428','final_429','final_430','final_431','final_432','final_433','final_434','final_435','final_436',...
    'final_437','final_438','final_439','final_440','final_441','final_442','final_443','final_444','final_445','final_446',...
    'final_447','final_448','final_449','final_450','final_451','final_452','final_453','final_454','final_455','final_456',...
    'final_457','final_458','final_459','final_460','final_461','final_462','final_463','final_464','final_465','final_466',...
    'final_467','final_468','final_469','final_470','final_471','final_472','final_473','final_474','final_475','final_476',...
    'final_477','final_478','final_479','final_480','final_481','final_482','final_483','final_484','final_485','final_486',...
    'final_487','final_488','final_489','final_490','final_491','final_492','final_493','final_494','final_495','final_496',...
    'final_497','final_498','final_499','final_500','final_501','final_502','final_503','final_504','final_505','final_506',...
    'final_507','final_508','final_509','final_510','final_511','final_512','Actual Condition'};
    finalTable=Table;

end
