-- AUTO-GENERATED: OP14-112 / 보아 행콕
-- rules_id=OP14-112 script_id=880002277 fingerprint=7a8d213880eb2922d0bb8129c99dea88538c9735dd8f2aeb3773f21b3a55cd9d
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP14-112]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_LIFE_FROM_DECK_TOP]],
            player=[[YOU]],
          },
          {
            count=1,
            mode=[[UP_TO]],
            op=[[TAKE_LIFE_TO_HAND]],
            player=[[OPPONENT]],
            position=[[TOP]],
            ["then"]=true,
          },
        },
        conditions={
          {
            op=[[LEADER_HAS_TRAIT]],
            player=[[YOU]],
            trait=[[왕의 부하 칠무해]],
          },
        },
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【등장 시】자신의 리더가 《왕의 부하 칠무해》 특징을 가진 경우, 자신의 덱 위에서 1장까지를 라이프 맨 위에 더한다. 그 후, 상대의 라이프 위에서 1장까지를 주인의 패에 더한다.]],
        timings={
          [[ON_PLAY]],
        },
      },
      {
        actions={
          {
            count=1,
            filter={
              base_power_lte=6000,
              card_type=[[CHARACTER]],
              has_trigger=true,
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[자신의 패에서 파워가 6000 이하인 【트리거】를 가진 캐릭터 카드 1장까지를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[OP14-112]],
    schema_version=1,
  })
end
