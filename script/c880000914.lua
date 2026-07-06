-- AUTO-GENERATED: OP07-059 / 폭시
-- rules_id=OP07-059 script_id=880000914 fingerprint=29e9b610e843f76373b6b70241f8f6c3a116b72fd1dde759d894a31be8fc3e6e
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[OP07-059]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            op=[[REST]],
            selector={
              count=1,
              filter={
                state=[[RESTED]],
              },
              kind=[[LEADER_OR_CHARACTER]],
              mode=[[UP_TO]],
              owner=[[OPPONENT]],
            },
          },
          {
            duration=[[UNTIL_OPPONENT_NEXT_REFRESH]],
            op=[[CANNOT_SET_ACTIVE]],
            selector={
              count=1,
              kind=[[LAST_TARGET]],
              mode=[[UP_TO]],
              owner=[[CONTEXT]],
            },
            ["then"]=true,
          },
        },
        conditions={
          {
            count=3,
            filter={
              trait=[[폭시 해적단]],
            },
            op=[[CHARACTER_COUNT_GTE]],
            player=[[YOU]],
          },
        },
        costs={
          {
            count=3,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E1]],
        once_per_turn=false,
        source_text=[[【어택 시】두웅!!-3(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 자신의 《폭시 해적단》 특징을 가진 캐릭터가 3장 이상인 경우, 상대의 레스트 상태인 리더와 캐릭터를 1장까지 선택한다. 선택한 카드는 다음 상대의 리프레시 페이즈에 액티브 되지 않는다.]],
        timings={
          [[WHEN_ATTACKING]],
        },
      },
    },
    keywords={},
    rules_id=[[OP07-059]],
    schema_version=1,
  })
end
