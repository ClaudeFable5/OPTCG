-- AUTO-GENERATED: OP14-089 / 류마
-- rules_id=OP14-089 script_id=880002254 fingerprint=f1f7149a0a54a7ca809b995fb25ab54b8c26428ed1b90b35e588fedc86c44173
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-089]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=2,
            op=[[DRAW]],
            player=[[YOU]],
          },
          {
            count=2,
            op=[[TRASH_HAND]],
            player=[[YOU]],
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【KO 시】카드를 2장 뽑고, 자신의 패 2장을 버린다.]],
        timings={
          [[ON_KO]],
        },
      },
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte=4,
              trait=[[스릴러 바크 해적단]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_TRASH]],
            player=[[YOU]],
            rested=true,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 트래시에서 코스트 4 이하인 《스릴러 바크 해적단》 특징을 가진 캐릭터 카드 1장까지를 레스트로 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-089]],
    schema_version=1,
  })
end
