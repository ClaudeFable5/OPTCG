-- AUTO-GENERATED: ST07-017 / 퀸 마마 샹테 호
-- rules_id=ST07-017 script_id=880001833 fingerprint=56324958d604bb40323fe6f82a535b7fc4a6e0a7ea978d46404f0c4d92c047a1
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[ST07-017]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            faceup=true,
            op=[[ADD_TO_OWNER_LIFE]],
            positions={
              [[LIFE_TOP]],
            },
            selector={
              count=1,
              filter={
                cost_eq=3,
              },
              kind=[[CHARACTER]],
              mode=[[UP_TO]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={
          {
            op=[[REST_SELF]],
          },
          {
            count=1,
            op=[[TAKE_LIFE_TO_HAND]],
            position=[[TOP_OR_BOTTOM]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【기동: 메인】 이 스테이지를 레스트 하고, 자신의 라이프 위나 아래에서 1장을 패에 더할 수 있다: 자신의 코스트 3인 캐릭터를 1장까지 주인의 라이프 맨 위에 앞면으로 더한다.]],
        timings={
          [[ACTIVATE_MAIN]],
        },
      },
      {
        actions={
          {
            op=[[PLAY_SELF]],
            rested=false,
          },
        },
        conditions={},
        costs={},
        effect_id=[[T1]],
        once_per_turn=false,
        source_text=[[이 카드를 등장시킨다.]],
        timings={
          [[LIFE_TRIGGER]],
        },
      },
    },
    keywords={},
    rules_id=[[ST07-017]],
    schema_version=1,
  })
end
