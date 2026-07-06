-- AUTO-GENERATED: EB01-034 / 미스 웬즈데이
-- rules_id=EB01-034 script_id=880000033 fingerprint=16861340314d1add6aa27a465bae140fc7ac37c47f7836188983c5cb34652cfa
local s,id=GetID()
function s.initial_effect(c)
  opcg.RegisterCard(c,{
    base_card_no=[[EB01-034]],
    compile_status=[[AUTO]],
    effects={
      {
        actions={
          {
            count=1,
            mode=[[UP_TO]],
            op=[[ADD_DON]],
            state=[[ACTIVE]],
          },
        },
        conditions={
          {
            op=[[LEADER_TRAIT_CONTAINS]],
            player=[[YOU]],
            trait=[[바로크 워크스]],
          },
        },
        costs={
          {
            count=1,
            op=[[RETURN_DON]],
          },
        },
        effect_id=[[E2]],
        once_per_turn=true,
        source_text=[[【상대의 어택 시】【턴 1회】두웅!!-1(자신 필드의 두웅!!을 지정된 수만큼 두웅!! 덱으로 되돌릴 수 있다): 자신의 리더가 『바로크 워크스』를 포함한 특징을 가진 경우, 두웅!! 덱에서 두웅!!을 1장까지 액티브 상태로 추가한다.]],
        timings={
          [[ON_OPPONENT_ATTACK]],
        },
      },
    },
    keywords={
      [[BLOCKER]],
    },
    rules_id=[[EB01-034]],
    schema_version=1,
  })
end
