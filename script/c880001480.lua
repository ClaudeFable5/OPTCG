-- AUTO-GENERATED: OP12-027 / 코시로
-- rules_id=OP12-027 script_id=880001480 fingerprint=8297cdbe9e614c7fed3dd3ac064518aeb2bf72220ac7d1a26f5d22ac015e973c
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP12-027]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            duration=[[WHILE_CONDITION]],
            op=[[REPLACE_KO]],
            optional=true,
            reason=[[OPPONENT_EFFECT]],
            replacement_costs={
              {
                op=[[REST_SELF]],
              },
            },
            selector={
              count=0,
              filter={
                attribute=[[SLASH]],
                cost_lte=5,
                exclude_self=true,
              },
              kind=[[CHARACTER]],
              mode=[[ALL]],
              owner=[[YOU]],
            },
          },
        },
        conditions={},
        costs={},
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[이 캐릭터 이외의 자신의 코스트 5 이하인 <참격> 속성을 가진 캐릭터가 상대의 효과로 KO 당할 경우, 대신 이 캐릭터를 레스트할 수 있다.]],
        timings={
          [[CONTINUOUS]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[OP12-027]],
    schema_version=1,
  })
end
