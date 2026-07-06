-- AUTO-GENERATED: OP08-098 / 카르가라
-- rules_id=OP08-098 script_id=880001074 fingerprint=24caaa0f69a81385b10aa13358abe49a05e64091b3742817139bd65fede52269
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP08-098]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            filter={
              card_type=[[CHARACTER]],
              cost_lte_field_don_of=[[YOU]],
              trait=[[샨도라의 전사]],
            },
            mode=[[UP_TO]],
            op=[[PLAY_FROM_HAND]],
            player=[[YOU]],
            rested=false,
          },
          {
            actions={
              {
                count=1,
                op=[[TAKE_LIFE_TO_HAND]],
                player=[[YOU]],
                position=[[TOP]],
              },
            },
            conditions={
              {
                op=[[LAST_ACTION_SUCCEEDED]],
              },
            },
            op=[[IF]],
            ["then"]=true,
          },
        },
        conditions={},
        costs={},
        don_attached=1,
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【두웅!!×1】【어택 시】자신의 패에서 자신 필드의 두웅!! 수 이하의 코스트를 가지고, 《샨도라의 전사》 특징을 가진 캐릭터 카드를 1장까지 등장시킨다. 등장시켰을 경우, 자신의 라이프 위에서 1장을 패에 더한다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP08-098]],
    schema_version=1,
  })
end
