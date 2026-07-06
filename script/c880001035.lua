-- AUTO-GENERATED: OP08-059 / 알베르
-- rules_id=OP08-059 script_id=880001035 fingerprint=117e9e14322ad66f5be6dec889019fdae459df44a617ec53c0e2641cb4445979
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-059]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            actions={
              {
                count=1,
                filter={
                  cost_lte=7,
                  name=[[킹]],
                },
                mode=[[UP_TO]],
                op=[[PLAY_FROM_HAND]],
                player=[[YOU]],
                rested=false,
              },
            },
            conditions={
              {
                count=10,
                op=[[FIELD_DON_EQ]],
                player=[[YOU]],
              },
            },
            op=[[IF]],
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[백수 해적단]],
          },
        },
        costs={
          {
            op=[[TRASH_SELF]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】이 캐릭터를 트래시에 놓을 수 있다: 자신의 리더가 《백수 해적단》 특징을 가지고, 자신 필드에 두웅!!이 10장인 경우, 자신의 패에서 코스트 7 이하인 「킹」을 1장까지 등장시킨다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-059]],
    schema_version=1,
  })
end
